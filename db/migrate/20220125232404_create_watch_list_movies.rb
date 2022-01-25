class CreateWatchListMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :watch_list_movies do |t|
      t.references :user, null: false, foreign_key: true
      t.references :movie, null: false, foreign_key: true
      t.integer :order

      t.timestamps
    end
  end
end
