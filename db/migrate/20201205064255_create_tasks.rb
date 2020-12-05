class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.text :title
      t.text :description
      t.integer :time
      t.integer :num_participants
      t.boolean :private

      t.timestamps
    end
  end
end
