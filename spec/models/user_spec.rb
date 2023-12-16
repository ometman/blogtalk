require 'rails_helper'
require 'factory_bot_rails'

RSpec.describe User, type: :model do
  describe 'validation tests' do
    let(:test_user) { build(:user, name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVvo', bio: 'Teacher from Mexico.') }

    it 'validates presence of name' do
      test_user.name = nil
      expect(test_user).to_not be_valid
    end

    it 'validates posts counter to be greater than or equal to 0' do
      test_user.posts_counter = -1
      expect(test_user).to_not be_valid
    end

    it 'validates numericality of posts counter' do
      test_user.posts_counter = 'xyz'
      expect(test_user).to_not be_valid
    end
  end

  describe 'recent_posts method tests' do
    let(:user) { create(:user, name: 'test_user') }
    let!(:post1) { create(:post, author: user, created_at: 1.day.ago) }
    let!(:post2) { create(:post, author: user, created_at: 2.days.ago) }
    let!(:post3) { create(:post, author: user, created_at: 3.days.ago) }
    let!(:post4) { create(:post, author: user, created_at: 4.days.ago) }

    context 'when user exists' do
      it 'returns the recent posts' do
        recent_posts = User.recent_posts('test_user', 3)

        expect(recent_posts).to_not be_nil
        expect(recent_posts.count).to eq(3)
        expect(recent_posts).to include(post1, post2, post3)
        expect(recent_posts).to_not include(post4)
      end

      it 'returns default number of recent posts if limit is not provided' do
        recent_posts = User.recent_posts('test_user')

        expect(recent_posts).to_not be_nil
        expect(recent_posts.count).to eq(3) # Assuming default limit is 3
        expect(recent_posts).to include(post1, post2, post3)
        expect(recent_posts).to_not include(post4)
      end
    end

    context 'when user does not exist' do
      it 'returns nil' do
        recent_posts = User.recent_posts('nonexistent_user')

        expect(recent_posts).to be_nil
      end
    end
  end
end
