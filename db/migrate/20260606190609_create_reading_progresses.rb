class CreateReadingProgresses < ActiveRecord::Migration[8.0]
  def change
    create_table :reading_progresses do |t|
      t.references :user, null: false, foreign_key: true
      t.references :bible_version, null: false, foreign_key: true
      t.string :book
      t.integer :chapter
      t.integer :verse
      t.datetime :read_at

      t.timestamps
    end
  end
end
