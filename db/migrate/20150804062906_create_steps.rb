class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.integer :position_id
      t.integer :phase_id
      t.integer :steps
      t.timestamps null: false
    end
  end
end
