class Task < ApplicationRecord
    #Relationships
    belongs_to :user, optional: true
end
