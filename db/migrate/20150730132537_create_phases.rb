class CreatePhases < ActiveRecord::Migration
  def change
    create_table :phases do |t|
      t.string :description, :null => false
      t.timestamps null: false
    end
  end
end
