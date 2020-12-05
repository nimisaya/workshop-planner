class Task < ApplicationRecord
    #Relationships
    belongs_to :user, optional: true
    has_and_belongs_to_many :workshops
end
