module Api
  module V2
    class UsersController < Api::V1::BaseController
      before_action :set_user, only: [:show]

      # V2: Enhanced response with additional fields
      def index
        @users = User.all
        render json: {
          success: true,
          message: 'Success',
          version: '2.0.0',
          data: @users.as_json(
            only: [:id, :email, :name, :role, :credit_balance, :organization, :locale, :created_at],
            methods: [:full_name]
          ),
          meta: {
            total_count: @users.count,
            api_version: 'v2'
          }
        }, status: :ok
      end

      def show
        render json: {
          success: true,
          message: 'Success',
          version: '2.0.0',
          data: @user.as_json(
            only: [:id, :email, :name, :role, :credit_balance, :organization, :locale, :created_at, :updated_at],
            methods: [:full_name]
          ),
          meta: {
            api_version: 'v2'
          }
        }, status: :ok
      end

      private

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end