class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :poker_table, index: true
      t.timestamps null: false
    end
  end
end
