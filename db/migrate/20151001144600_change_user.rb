class ChangeUser < ActiveRecord::Migration
  def change
    add_index :users,:email, unique: true
    remove_column :users,:name
  end
end
