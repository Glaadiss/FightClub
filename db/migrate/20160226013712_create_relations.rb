class CreateRelations < ActiveRecord::Migration
  def change
    create_table :relations do |t|
      t.integer :fighter_id
      t.integer :skill_id

      t.timestamps null: false
    end
  end
end
