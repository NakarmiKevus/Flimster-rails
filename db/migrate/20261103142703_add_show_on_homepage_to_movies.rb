class AddShowOnHomepageToMovies < ActiveRecord::Migration[8.1]
  def change
    add_column :movies, :show_on_homepage, :boolean, default: false
  end
end