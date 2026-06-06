class CreateBibleVersions < ActiveRecord::Migration[8.0]
  def change
    create_table :bible_versions do |t|
      t.string :name
      t.string :language
      t.string :abbreviation

      t.timestamps
    end
  end
end
