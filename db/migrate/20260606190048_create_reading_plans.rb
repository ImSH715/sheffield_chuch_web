class CreateReadingPlans < ActiveRecord::Migration[8.0]
  def change
    create_table :reading_plans do |t|
      t.string :title
      t.text :description
      t.string :plan_type
      t.integer :total_days

      t.timestamps
    end
  end
end
