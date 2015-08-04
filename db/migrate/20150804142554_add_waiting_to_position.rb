class AddWaitingToPosition < ActiveRecord::Migration
  def change
    add_column :positions, :waiting, :boolean, :default => false
  end
end
