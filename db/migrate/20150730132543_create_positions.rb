class CreatePositions < ActiveRecord::Migration
  def change
    create_table :positions do |t|
      t.string :name
      t.string :company
      t.text :description
      t.integer :user_id
      t.integer :phase_id
      t.text :note
      t.datetime :deadline
      t.timestamps null: false
    end

    add_index :positions, :user_id
    add_index :positions, :phase_id
  end
end
