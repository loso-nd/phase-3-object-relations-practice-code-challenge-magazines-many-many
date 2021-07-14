class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :magazine #magazine_id
      t.references :reader #reader_id
      t.integer :price
    end
  end
end


#creating a funciton that writes a loop, encased with methods that can create things with keys
#foreign keys have id's