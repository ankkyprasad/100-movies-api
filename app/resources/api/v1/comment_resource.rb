# frozen_string_literal: true

module Api
  module V1
    class CommentResource < JSONAPI::Resource
      attributes :comment, :user_id, :movie_id, :user_name

      def user_name
        User.find_by_id(user_id).name
      end
    end
  end
end