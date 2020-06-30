class AddRoleCountToMovies < ActiveRecord::Migration[6.0]
  def change
    add_column :movies, :roles_count, :integer
  end
end
