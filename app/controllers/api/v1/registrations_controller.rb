module Api
  module V1
    class RegistrationsController < Devise::RegistrationsController
      respond_to :json

      private

      def respond_with(resource, _opts = {})
        if resource.persisted?
          render json: {
            success: true,
            message: 'Signed up successfully',
            data: {
              user: {
                id: resource.id,
                email: resource.email,
                name: resource.name
              }
            }
          }, status: :ok
        else
          render json: {
            success: false,
            message: 'Sign up failed',
            errors: resource.errors.full_messages
          }, status: :unprocessable_entity
        end
      end
    end
  end
end