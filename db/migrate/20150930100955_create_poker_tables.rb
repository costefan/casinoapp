class CreatePokerTables < ActiveRecord::Migration
  def change
    create_table :poker_tables do |t|
      t.string :name
      t.datetime :start_date

      t.timestamps null: false
    end
  end
end
