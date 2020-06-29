class AddRoleCountToActors < ActiveRecord::Migration[6.0]
  def change
    add_column :actors, :roles_count, :integer
  end
end
