module Api
  module V1
    class UsersController < ApplicationController
      include JSONAPI::ActsAsResourceController
      rescue_from ActiveRecord::RecordNotFound, with: :user_not_found
      before_action :user_auth, except: %i[register login]
      before_action :admin_role, only: [:index]

      def register
        user = User.create!(register_params)
        render json: {message: 'user created'}, status: :created
      rescue ActiveRecord::RecordInvalid => e
        return render json: {error: e.record.errors}, status: :unprocessable_entity
      end

      def login
        user = User.find_by_email!(params[:email])

        if !user.authenticate(params[:password])
          return render json: {message: 'invalid email or password'}, status: :unauthorized
        end

        token = JwtHelper.encode(user_id: user.id)
        render json: {message: 'login success', token: token}, status: :created
      end

      def logout
        JwtToken.create!(token: @token, user_id: @current_user.id)
        render json: {message: 'logged out'}, status: :no_content
      end

      private

      def user_not_found
        return render json: {error: 'user not found'}, status: :not_found
      end

      def register_params
        params.permit(:email, :password, :name)
      end
    end
  end
end