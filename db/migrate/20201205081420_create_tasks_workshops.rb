class CreateTasksWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks_workshops do |t|
      t.integer :task_id
      t.integer :workshop_id
    end
  end
end
