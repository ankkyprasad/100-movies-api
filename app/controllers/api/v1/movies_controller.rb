module Api
  module V1
    class MoviesController < ApplicationController
      include JSONAPI::ActsAsResourceController

      def casts
        p params[:id]
        movie = Movie.find_by_id(params[:id])

        return render json: {message: 'Movie Not Found!!'}, status: :not_found unless movie

        data = {
          type: 'movies',
          attributes: movie.actors
        }
        render json: {data: data}, status: :ok
      end
    end
  end
end