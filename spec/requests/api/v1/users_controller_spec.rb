require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'GET /api/v1/users' do
    before do
      User.create!(email: 'user1@example.com', password: 'password123', password_confirmation: 'password123', name: 'User 1', credit_balance: 100)
      User.create!(email: 'user2@example.com', password: 'password123', password_confirmation: 'password123', name: 'User 2', credit_balance: 50)
    end

    it 'returns all users' do
      get '/api/v1/users'
      
      expect(response).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['success']).to be true
      expect(json['data'].size).to eq(2)
    end
  end

  describe 'POST /api/v1/users' do
    let(:valid_attributes) do
      {
        user: {
          email: 'newuser@example.com',
          password: 'password123',
          password_confirmation: 'password123',
          name: 'New User',
          role: 0,
          credit_balance: 100
        }
      }
    end

    it 'creates a new user' do
      expect {
        post '/api/v1/users', params: valid_attributes, as: :json
      }.to change(User, :count).by(1)

      expect(response).to have_http_status(201)
      json = JSON.parse(response.body)
      expect(json['success']).to be true
      expect(json['data']['email']).to eq('newuser@example.com')
    end
  end
end