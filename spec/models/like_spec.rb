# require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'associations' do
    it { should belong_to(:user) }
    it { should belong_to(:post) }
  end

  describe 'callbacks' do
    let!(:post) { create(:post) }
    let!(:like) { create(:like, post: post) }

    it 'increments post likes_counter after creating a like' do
      expect { create(:like, post: post) }.to change { post.reload.likes_counter }.by(1)
    end

    it 'decrements post likes_counter after destroying a like' do
      expect { like.destroy }.to change { post.reload.likes_counter }.by(-1)
    end
  end
end