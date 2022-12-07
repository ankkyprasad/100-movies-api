module Api
  module V1
    class CommentsController < ApplicationController
      include JSONAPI::ActsAsResourceController
      before_action :user_auth, except: %i[index]

      private

      def current_user
        return params[:data][:attributes][:user_id] == @current_user.id
      end
    end
  end
end