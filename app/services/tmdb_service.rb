class TmdbService
  BASE_URL = "https://api.themoviedb.org/3"

  def self.connection
    HTTP
      .headers(
        accept: "application/json",
        authorization: "Bearer #{ENV.fetch('TMDB_ACCESS_TOKEN')}"
      )
  end

  def self.popular_movies
    response = connection.get("#{BASE_URL}/movie/popular")

    response.parse
  end

  def self.save_popular_movies
    movies = popular_movies["results"]
    movies.each do |tmdb_movie|
        Movie.save_from_tmdb(tmdb_movie)
    end
  end 

  def self.search_movies(query)
    response = connection.get(
        "#{BASE_URL}/search/movie",
        params: {
        query: query
        }
    )
    response.parse
  end

end