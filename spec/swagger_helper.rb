require 'rails_helper'

RSpec.configure do |config|
  config.swagger_root = Rails.root.join('swagger').to_s

  config.swagger_docs = {
    'v1/swagger.yaml' => {
      openapi: '3.0.1',
      info: {
        title: 'SDP Platform API',
        version: 'v1',
        description: 'Scale Development Platform - RESTful API Documentation',
        contact: {
          name: 'Aybüke TURGUN',
          email: 'aybuket@example.com'
        }
      },
      paths: {},
      servers: [
        {
          url: 'http://localhost:3000',
          description: 'Development server'
        },
        {
          url: 'https://api.sdp-platform.com',
          description: 'Production server'
        }
      ],
      components: {
        schemas: {
          User: {
            type: :object,
            properties: {
              id: { type: :string, format: :uuid },
              email: { type: :string },
              name: { type: :string },
              role: { type: :string, enum: ['researcher', 'clinician', 'student', 'admin'] },
              credit_balance: { type: :integer },
              organization: { type: :string },
              locale: { type: :string }
            },
            required: ['id', 'email', 'name', 'role']
          }
        }
      }
    }
  }

  config.swagger_format = :yaml
end