class CreatePrayerRequests < ActiveRecord::Migration[8.0]
  def change
    create_table :prayer_requests do |t|
      t.string :title
      t.text :body
      t.references :group, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.references :written_for, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
