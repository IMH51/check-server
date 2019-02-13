class CreateQueries < ActiveRecord::Migration[5.2]
  def change
    create_table :queries do |t|
      t.integer :user_id
      t.string :com_card1
      t.string :com_card2
      t.string :com_card3
      t.string :com_card4
      t.string :com_card5
      t.string :hand_card1
      t.string :hand_card2
      t.integer :players

      t.timestamps
    end
  end
end
