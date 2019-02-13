class CreateOdds < ActiveRecord::Migration[5.2]
  def change
    create_table :odds do |t|
      t.integer :query_id
      t.float :win
      t.float :lose
      t.float :tie

      t.timestamps
    end
  end
end
