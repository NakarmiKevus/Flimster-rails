class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  
  def self.save_from_tmdb(tmdb_movie)
    movie = find_or_initialize_by(tmdb_id: tmdb_movie["id"])

    movie.assign_attributes(
      title: tmdb_movie["title"],
      description: tmdb_movie["overview"],
      poster_url: tmdb_movie["poster_path"].present? ? "https://image.tmdb.org/t/p/w500#{tmdb_movie["poster_path"]}" : nil,
      backdrop_path: tmdb_movie["backdrop_path"],
      release_date: tmdb_movie["release_date"].presence,
      popularity: tmdb_movie["popularity"],
      average_vote: tmdb_movie["vote_average"],
      total_votes: tmdb_movie["vote_count"]
    )

    movie.save!
    movie
  end
end