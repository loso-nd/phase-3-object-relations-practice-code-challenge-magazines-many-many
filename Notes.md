#Migration Started!

Set up:
    - bundle
    - rake -T (provides a list of commons)
    - `rake console` - to test out methods


    Step #1: Create Migration Table > Roles
        - rake db:create_migration NAME="create_roles"
        - rake db:migrate (shows created tables)
        * model is singular and the migration is plural

    *Check schema.rb to see the tables we have created. 
    *If mistake has been made we can use _rake db:rollback_ to revert changes and then run _rake db:migrate to update our schema again. 


    Step #2: Build out the Migration Table w/ Details
        - How do we connect things in a DB based on a join model ( id's)
            *recall belongs to <=> foreign keys (ex movie_id, actor_id)
        - Set up the migration table using attributes given in deliverables
        - recall role is a model and represents our app, migration is for the database. Models interact with the database
```
    Example of Building a Migration Table

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
```

    Step #3 Code a little, Test Alot
        - rake db:migrate
        - rake db:rollback if I want to run it back
            *If we rollback, we should see our schema file change reverting back to previous file status.
        - rake db:seed will run the seed file to see what is already there. At this momment we don't have instances for Roles


    Step #4: Object Relationship Methods
        Start building the model relationships (See roles.rb, actor.rb, movie.rb)
```
        Examples:

        class Actor < ActiveRecord::Base
            has_many :roles
            has_many :movies, through: :roles
        end

        class Movie < ActiveRecord::Base
            has_many :roles
            has_many :actors, through: :roles
        end

        class Role < ActiveRecord::Base
#belongs_to method and receives a symbol representing an actor 
            belongs_to :actor
            belongs_to :movie
        end
```

    Step #5: Add Instances of our Model Classes To Test Code
        - Add creation of instance for roles to seed file 
        - rake db:seed will run the seed file to see what is already there.
        * Add the following to the top of the file:
            puts "Deleting movie/actor data..."
            Movie.destroy_all
            Actor.destroy_all
            Role.destroy_all
        - rake console
            Commands to test:
                Actor.all > Movie.all > Roles.all
                Actor.first > Actor.fourth
                Actor.first.roles


Overall Workflow
    Create Migration Table > 
        - rake db:create_migration NAME="create_roles" 
        - rake db:migrate
        - Check schema file for updates 
        - rake console to check for mistakes

        build migration > rake console | models relationships > rake console | Add instance in seed file > rake db:seed rake console


        deliverables on aggregate methods 

Questions

<!-- **Remember!** This code challenge does not have tests. You cannot run `rspec` and you cannot run `learn`. You'll need to create your own sample instances so that you can try out your code on your own. Make sure your associations and methods work in the console before submitting -->