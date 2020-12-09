class AddWorkshopIdToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :workshop_id, :integer
  end
end
