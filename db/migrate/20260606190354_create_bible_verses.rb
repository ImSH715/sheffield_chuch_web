class CreateBibleVerses < ActiveRecord::Migration[8.0]
  def change
    create_table :bible_verses do |t|
      t.references :bible_version, null: false, foreign_key: true
      t.string :book_code
      t.integer :chapter
      t.integer :verse
      t.text :text

      t.timestamps
    end
  end
end
