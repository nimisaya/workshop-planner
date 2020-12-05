class CreateWorkshops < ActiveRecord::Migration[5.2]
  def change
    create_table :workshops do |t|
      t.text :title
      t.text :description
      t.integer :total_time
      t.boolean :private
      t.integer :user_id

      t.timestamps
    end
  end
end
