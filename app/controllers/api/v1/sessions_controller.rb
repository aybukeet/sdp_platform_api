module Api
  module V1
    class SessionsController < Devise::SessionsController
      respond_to :json

      private

      def respond_with(resource, _opts = {})
        render json: {
          success: true,
          message: 'Logged in successfully',
          data: {
            user: {
              id: resource.id,
              email: resource.email,
              name: resource.name
            }
          }
        }, status: :ok
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end