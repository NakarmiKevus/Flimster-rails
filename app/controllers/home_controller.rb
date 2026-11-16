class HomeController < ApplicationController
  def index
    if Movie.count.zero?
      TmdbService.save_popular_movies
    end
    
    @movies = Movie.where(show_on_homepage: true)

    @reviews = Review.includes(:user, :movie).order(created_at: :desc)
  end
end
