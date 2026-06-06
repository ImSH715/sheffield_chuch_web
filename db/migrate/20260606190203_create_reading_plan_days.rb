class CreateReadingPlanDays < ActiveRecord::Migration[8.0]
  def change
    create_table :reading_plan_days do |t|
      t.references :reading_plan, null: false, foreign_key: true
      t.integer :day_number
      t.string :reference_text

      t.timestamps
    end
  end
end
