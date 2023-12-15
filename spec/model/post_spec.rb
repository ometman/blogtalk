require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'associations' do
    it { should belong_to(:author).class_name('User').with_foreign_key(:author_id) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_length_of(:title).is_at_most(250) }
    it { should validate_numericality_of(:comments_counter).is_greater_than_or_equal_to(0) }
    it { should validate_numericality_of(:likes_counter).is_greater_than_or_equal_to(0) }
  end

  describe 'callbacks' do
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
    let!(:post) { create(:post) }
    let!(:comments) { create_list(:comment, 10, post: post) }

    it 'returns 5 most recent comments for a post' do
      expect(post.recent_comments(5).count).to eq(5)
    end
  end
end