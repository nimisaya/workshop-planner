class Workshop < ApplicationRecord

    # Relationships
    belongs_to :user, optional: true
    has_many :tasks
end
