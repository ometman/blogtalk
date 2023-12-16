require 'rails_helper'

RSpec.describe Post, type: :model do

  describe 'post validations test' do
    it 'validates presence of title' do
      post = Post.new(comments_counter: 0, likes_counter: 0)
      expect(post.valid?).to be_falsey
      expect(post.errors[:title]).to include("can't be blank")
    end
  
    it 'validates length of title' do
      post = Post.new(title: 'a' * 251, comments_counter: 0, likes_counter: 0)
      expect(post.valid?).to be_falsey
      expect(post.errors[:title]).to include('is too long (maximum is 250 characters)')
    end
  
    it 'validates numericality of comments_counter' do
      post = Post.new(title: 'Valid Title', comments_counter: 'not_a_number', likes_counter: 0)
      expect(post.valid?).to be_falsey
      expect(post.errors[:comments_counter]).to include('is not a number')
    end
  
    it 'validates numericality of likes_counter' do
      post = Post.new(title: 'Valid Title', comments_counter: 0, likes_counter: 'not_a_number')
      expect(post.valid?).to be_falsey
      expect(post.errors[:likes_counter]).to include('is not a number')
    end
  end
  
  describe 'callbacks for increment and decrement of posts count' do
    let!(:author) { create(:user) }
    let!(:post) { create(:post, author: author) }

    it 'increments user posts_counter after creating a post' do
      expect { create(:post, author: author) }.to change { author.reload.posts_counter }.by(1)
    end

    it 'decrements user posts_counter after destroying a post' do
      expect { post.destroy }.to change { author.reload.posts_counter }.by(-1)
    end
  end

  describe '#recent_comments' do
    let!(:post_with_comments) { create(:post_with_comments) }

    it 'returns 5 most recent comments for a post' do
      expect(post_with_comments.recent_comments(5).count).to eq(5)
    end
  end
end
