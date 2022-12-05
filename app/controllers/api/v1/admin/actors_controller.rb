module Api
  module V1
    module Admin
      class ActorsController < ApplicationController
        include JSONAPI::ActsAsResourceController
        before_action :user_auth
        before_action :admin_role
      end
    end
  end
end