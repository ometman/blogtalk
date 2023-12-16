require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'callbacks' do
    let!(:post) { create(:post) }
    let!(:comment) { create(:comment, post:) }

    it 'increments post comments_counter after creating a comment' do
      expect { create(:comment, post:) }.to change { post.reload.comments_counter }.by(1)
    end

    it 'decrements post comments_counter after destroying a comment' do
      expect { comment.destroy }.to change { post.reload.comments_counter }.by(-1)
    end
  end
end
