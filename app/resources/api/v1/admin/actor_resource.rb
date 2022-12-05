# frozen_string_literal: true

module Api
  module V1
    module Admin
      class ActorResource < JSONAPI::Resource
        attributes :name, :date_of_birth, :gender, :about, :user_id
      end
    end
  end
end