class AddCurrentStepToPositions < ActiveRecord::Migration
  def change
    add_column :positions, :current_step, :integer
    add_column :positions, :step_description, :string
  end

end
