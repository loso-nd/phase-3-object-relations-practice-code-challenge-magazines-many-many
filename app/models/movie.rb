class Movie < ActiveRecord::Base
    has_many :roles
    has_many :actors, through: :roles

    def cast_role(actor, character_name, salary)
        Role.create(actor_id: actor.id, character_name: "character_name", salary: salary)
    end
end