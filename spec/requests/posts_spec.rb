require 'rails_helper'
RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users/13/posts'
      expect(response.body).to include('<h2>List of Posts</h2>')
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/13/posts/7'
      expect(response.body).to include('<h2>Post</h2>')
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end
end
