class CreateTimeSpans < ActiveRecord::Migration
  def change
    create_table :time_spans do |t|
      t.datetime :start, null: false
      t.datetime :end, null: false
      t.references :task, index: true

      t.timestamps null: false
    end
    add_foreign_key :time_spans, :tasks
  end
end
