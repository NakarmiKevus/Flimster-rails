class CreateMovies < ActiveRecord::Migration[8.1]
  def change
    create_table :movies do |t|
      t.string :title
      t.string :poster_url
      t.text :description
      t.integer :duration
      t.date :release_date
      t.decimal :popularity
      t.bigint :budget
      t.decimal :average_vote
      t.integer :total_votes
      t.string :website_url

      t.timestamps
    end
  end
end
