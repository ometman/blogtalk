require 'rails_helper'

RSpec.describe UsersController, type: :request do
  describe 'GET #index' do
    it 'returns a successful response' do
      get users_path
      expect(response).to have_http_status(:ok)
    end

    it 'renders the index template' do
      get users_path
      expect(response).to render_template(:index)
    end

    it 'renders the correct content in the HTML view' do
      get users_path
      expect(response.body).to include('<h1>Users</h1>')
      expect(response.body).to include('<p>Here is the list of users.</p>')
    end
  end

  describe 'GET #show' do
    let(:user) { create(:user) }

    it 'returns a successful response' do
      get user_path(user)
      expect(response).to have_http_status(:ok)
    end

    it 'renders the show template' do
      get user_path(user)
      expect(response).to render_template(:show)
    end

    it 'renders the correct content in the HTML view' do
      get user_path(user)
      expect(response.body).to include('<h1>User Posts</h1>')
      expect(response.body).to include('<p>Here is the list of posts for a given user.</p>')
    end
  end
end
