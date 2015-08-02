class AddStageToPhases < ActiveRecord::Migration
  def change
    add_column :phases, :stage, :integer
    add_index :phases, :stage
  end
end
