class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.integer :movie_id
      t.integer :actor_id
      t.string :character_name
      t.text :description
      t.integer :role_type
      t.boolean :lead

      t.timestamps
    end
  end
end