# frozen_string_literal: true

module Api
  module V1
    module Admin
      class MovieResource < JSONAPI::Resource
        attributes :name, :release_date, :about, :language, :country_of_origin, :gross_worldwide, :runtime
      end
    end
  end
end