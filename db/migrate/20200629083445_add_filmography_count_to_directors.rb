class AddFilmographyCountToDirectors < ActiveRecord::Migration[6.0]
  def change
    add_column :directors, :filmography_count, :integer
  end
end
