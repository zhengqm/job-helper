class AddProgressToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :progress, :float
  end
end
