class CreateFights < ActiveRecord::Migration
  def change
    create_table :fights do |t|
      t.integer :first_id
      t.integer :second_id
      t.integer :winner
      t.integer :draw
      t.integer :draw2
      t.integer :lost

      t.timestamps null: false
    end
  end
end
