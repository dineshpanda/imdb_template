class AddFilmCountToDirectors < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :films_count, :integer
  end
end
