require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many(:posts).with_foreign_key(:author_id).dependent(:destroy) }
    it { should have_many(:comments).dependent(:destroy) }
    it { should have_many(:likes).dependent(:destroy) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_numericality_of(:posts_counter).is_greater_than_or_equal_to(0) }
  end

  describe '.recent_posts' do
    let!(:user) { create(:user) }
    let!(:posts) { create_list(:post, 5, author: user) }

    it 'returns 3 most recent posts for a user' do
      expect(User.recent_posts(user.name, 3).count).to eq(3)
    end
  end
end
