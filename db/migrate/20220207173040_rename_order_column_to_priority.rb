# frozen_string_literal: true

class RenameOrderColumnToPriority < ActiveRecord::Migration[6.1]
  def change
    rename_column :watch_list_movies, :order, :priority
  end
end
