
class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @reviews = @movie.reviews.includes(:user).order(created_at: :desc)
  end

  def search
    query = params[:q]

    if query.present?
      @movies = Movie.where("title LIKE ?", "%#{query}%")

      if @movies.empty?
        tmdb_results = TmdbService.search_movies(query)

        tmdb_results["results"].each do |tmdb_movie|
          Movie.save_from_tmdb(tmdb_movie)
        end

        @movies = Movie.where("title LIKE ?", "%#{query}%")
      end
    else
      @movies = Movie.none
    end
  end

end
