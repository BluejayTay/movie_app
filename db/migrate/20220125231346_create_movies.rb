# frozen_string_literal: true

class CreateMovies < ActiveRecord::Migration[6.1]
  def change
    create_table :movies do |t|
      t.string :name
      t.string :image_url
      t.integer :api_id

      t.timestamps
    end
  end
end
