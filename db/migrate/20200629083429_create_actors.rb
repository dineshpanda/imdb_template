class CreateActors < ActiveRecord::Migration[6.0]
  def change
    create_table :actors do |t|
      t.string :name
      t.string :dob
      t.text :bio
      t.string :image
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end