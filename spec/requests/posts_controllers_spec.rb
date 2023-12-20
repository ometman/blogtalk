require 'rails_helper'

RSpec.describe PostsController, type: :request do
  describe 'GET #index' do
    let(:user) { create(:user, id: 1) }
    let(:post) { create(:post, author: user) }

    it 'returns a successful response' do
      get user_posts_path(user.id)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get user_posts_path(user.id)
      expect(response).to render_template(:index)
    end

    it 'returns correct placeholder text in the response body' do
      get user_posts_path(user.id)
      expect(response.body).to include('<h1>Posts</h1>')
      expect(response.body).to include('<p>Here is the list of Posts</p>')
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user, id: 1) }
    let(:post) { create(:post, author: user) }

    it 'returns a successful response' do
      get user_post_path(user_id: 1, id: post.id)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      get user_post_path(user_id: 1, id: post.id)
      expect(response).to render_template(:show)
    end

    it 'returns correct placeholder text in the response body' do
      get user_post_path(user_id: 1, id: post.id)
      expect(response.body).to include('<h1>Post Content</h1>')
      expect(response.body).to include('<p>Here is the Specific post for given user.</p>')
    end
  end
end
