class Role < ActiveRecord::Base
    belongs_to :actor #belongs_to method and receives a symbol representing an actor 
    belongs_to :movie
end




