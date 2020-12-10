class Task < ApplicationRecord
    #Relationships
    belongs_to :user, optional: true
    belongs_to :workshop, optional: true

    # Information displayed about a task when adding a task to a workshop
    def task_details
        "#{title}"
    end # task_details
end # Task
