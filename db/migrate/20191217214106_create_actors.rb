class CreateActors < ActiveRecord::Migration[5.2]
  def change
    create_table :actors do |t|
      t.string :name
      
    end
  end
end


#create tables in your database
#database is in sql language
#AR translates database from sql language
#models interaact w/ the database