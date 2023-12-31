require 'rails_helper'
RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get '/users'
      expect(response.body).to include('<h2>List of Users</h2>')
      expect(response.status).to eq(200)
      expect(response).to render_template(:index)
    end
  end

  describe 'GET /show' do
    it 'returns http success' do
      get '/users/1'
      expect(response.body).to include('<h2>User\'s Page</h2>')
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
    end
  end
end
