class Task < ApplicationRecord
    #Relationships
    belongs_to :user, optional: true
    has_and_belongs_to_many :workshops

    # Information displayed about a task when adding a task to a workshop
    def task_details
        "#{title}, #{description}"
    end # task_details
end # Task
