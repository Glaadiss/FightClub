class CreateFighters < ActiveRecord::Migration
  def change
    create_table :fighters do |t|
      t.string :firstname
      t.string :lastname
      t.string :description
      t.attachment :avatar

      t.timestamps null: false
    end
  end
end
