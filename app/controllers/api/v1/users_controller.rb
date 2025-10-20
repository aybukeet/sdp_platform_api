module Api
  module V1
    class UsersController < BaseController
      before_action :set_user, only: [:show, :update, :destroy]

      # GET /api/v1/users
      def index
        @users = User.all
        render_success(@users)
      end

      # GET /api/v1/users/:id
      def show
        render_success(@user)
      end

      # POST /api/v1/users
      def create
        @user = User.new(user_params)
        
        if @user.save
          render_success(@user, message: 'User created successfully', status: :created)
        else
          render_error('Failed to create user', errors: @user.errors.full_messages)
        end
      end

      # PATCH/PUT /api/v1/users/:id
      def update
        if @user.update(user_params)
          render_success(@user, message: 'User updated successfully')
        else
          render_error('Failed to update user', errors: @user.errors.full_messages)
        end
      end

      # DELETE /api/v1/users/:id
      def destroy
        @user.destroy
        render_success(nil, message: 'User deleted successfully')
      end

      private

      def set_user
        @user = User.find(params[:id])
      end

      def user_params
        params.require(:user).permit(
          :email,
          :password,
          :password_confirmation,
          :name,
          :role,
          :credit_balance,
          :organization,
          :locale
        )
      end
    end
  end
end