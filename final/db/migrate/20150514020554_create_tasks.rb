class CreateTasks < ActiveRecord::Migration
  def change
	
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description, null: false
      t.integer :timespent :default => 0
      t.boolean :isDone

      t.timestamps null: false
    end
  end
end

