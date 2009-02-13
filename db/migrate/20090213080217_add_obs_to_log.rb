class AddObsToLog < ActiveRecord::Migration
  def self.up
    add_column :logs, :obs, :string
  end

  def self.down
    remove_column :logs, :obs
  end
end
