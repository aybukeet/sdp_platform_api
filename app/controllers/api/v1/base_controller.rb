module Api
  module V1
    class BaseController < ApplicationController
      # API için CSRF korumasını devre dışı bırak
     # skip_before_action :verify_authenticity_token
      
      # JSON response helper
      def render_success(data, message: 'Success', status: :ok)
        render json: {
          success: true,
          message: message,
          data: data
        }, status: status
      end

      def render_error(message, errors: [], status: :unprocessable_entity)
        render json: {
          success: false,
          message: message,
          errors: errors
        }, status: status
      end

      # Exception handling
      rescue_from ActiveRecord::RecordNotFound, with: :record_not_found
      rescue_from ActiveRecord::RecordInvalid, with: :record_invalid

      private

      def record_not_found(exception)
        render_error('Record not found', errors: [exception.message], status: :not_found)
      end

      def record_invalid(exception)
        render_error('Validation failed', errors: exception.record.errors.full_messages, status: :unprocessable_entity)
      end
    end
  end
end