class CreateRoles < ActiveRecord::Migration[5.2]
  def change
    create_table :roles do |t|
      t.integer :actor_id
      t.integer :movie_id
      t.integer :salary
      t.string :character_name
    end
  end
end