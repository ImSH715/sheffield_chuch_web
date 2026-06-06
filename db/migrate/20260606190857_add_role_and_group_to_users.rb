class AddRoleAndGroupToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :role, :integer, default: 0, null: false
    add_reference :users, :group, foreign_key: true
    add_column :users, :approved, :boolean, default: false, null: false
  end
end