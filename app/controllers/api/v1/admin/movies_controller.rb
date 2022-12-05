module Api
  module V1
    module Admin
      class MoviesController < ApplicationController
        include JSONAPI::ActsAsResourceController
        before_action :user_auth
        before_action :admin_role

        def create
          name = params[:data][:attributes][:name]
          release_date = params[:data][:attributes][:release_date]
          country_of_origin = params[:data][:attributes][:country_of_origin]
          runtime = params[:data][:attributes][:runtime]
          actors = params[:data][:attributes][:actors]

          actor_arr = []

          actors.each do |actor_id|
            actor = Actor.find_by_id(actor_id)
            if actor.nil?
              return render json: {message: 'actor not found!!'}, status: :not_found
            end
            actor_arr << actor
          end

          movie = Movie.create!(name: name, release_date: release_date, country_of_origin: country_of_origin, runtime: runtime, actors: actor_arr)
          data = {
            id: movie.id,
            type: 'movies',
            attributes: movie
          }
          render json: {data: data}, status: :created
        end
      end
    end
  end
end