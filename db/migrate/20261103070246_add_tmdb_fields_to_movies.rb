class AddTmdbFieldsToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :tmdb_id, :bigint
    add_column :movies, :backdrop_path, :string

    add_index :movies, :tmdb_id, unique: true
    
  end
end
