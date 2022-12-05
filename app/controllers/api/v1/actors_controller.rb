module Api
  module V1
    class ActorsController < ApplicationController
      include JSONAPI::ActsAsResourceController

    end
  end
end