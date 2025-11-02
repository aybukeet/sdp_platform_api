require 'swagger_helper'

RSpec.describe 'api/v1/users', type: :request do

  path '/api/v1/users' do

    get('List all users') do
      tags 'Users'
      produces 'application/json'
      description 'Returns all users in the system'

      response(200, 'successful') do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            message: { type: :string },
            data: {
              type: :array,
              items: { '$ref' => '#/components/schemas/User' }
            }
          },
          required: ['success', 'message', 'data']

        run_test!
      end
    end

    post('Create a user') do
      tags 'Users'
      consumes 'application/json'
      produces 'application/json'
      description 'Creates a new user'

      parameter name: :user, in: :body, schema: {
        type: :object,
        properties: {
          user: {
            type: :object,
            properties: {
              email: { type: :string },
              password: { type: :string },
              password_confirmation: { type: :string },
              name: { type: :string },
              role: { type: :integer },
              credit_balance: { type: :integer }
            },
            required: ['email', 'password', 'password_confirmation', 'name']
          }
        }
      }

      response(201, 'created') do
        let(:user) { { user: { email: 'test@example.com', password: 'password123', password_confirmation: 'password123', name: 'Test User', role: 0, credit_balance: 100 } } }
        run_test!
      end
    end
  end

  # 👇 BU BLOK DIŞARIDA DEĞİL, İÇERİDE OLMALI
  path '/api/v1/users/{id}' do
    parameter name: 'id', in: :path, type: :string, description: 'User ID'

    get('Show a user') do
      tags 'Users'
      produces 'application/json'

      response(200, 'successful') do
        schema type: :object,
          properties: {
            success: { type: :boolean },
            message: { type: :string },
            data: { '$ref' => '#/components/schemas/User' }
          }

        let(:test_user) { User.create!(email: 'show@example.com', password: 'password123', password_confirmation: 'password123', name: 'Show User', credit_balance: 100) }
        let(:id) { test_user.id }
        
        run_test!
      end

      response(404, 'not found') do
        let(:id) { 'invalid' }
        run_test!
      end
    end
  end
end
