class ChangeUserColumn < ActiveRecord::Migration
  def change
    rename_column :users,:password,:email
  end
end
