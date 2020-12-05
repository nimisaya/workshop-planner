class AddToolsToTasks < ActiveRecord::Migration[5.2]
  def change
    add_column :tasks, :tools, :text
  end
end
