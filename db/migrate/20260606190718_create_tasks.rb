class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :description
      t.string :task_type
      t.string :scope
      t.references :group, null: false, foreign_key: true
      t.references :created_by, null: false, foreign_key: { to_table: :users }
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
