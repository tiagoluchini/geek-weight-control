class RenameTargetFieldsAndAddMissingStarting < ActiveRecord::Migration
  def self.up
    remove_index :targets, :date
    
    remove_column :targets, :date
    remove_column :targets, :weight

    add_column :targets, :starting_date, :date    
    add_column :targets, :starting_weight, :float
    add_column :targets, :target_date, :date    
    add_column :targets, :target_weight, :float

    add_index :targets, :starting_date
    add_index :targets, :target_date
  end

  def self.down
    add_index :targets, :date
    
    add_column :targets, :date, :date
    add_column :targets, :weight, :float

    remove_column :targets, :starting_date
    remove_column :targets, :starting_weight
    remove_column :targets, :target_date
    remove_column :targets, :target_weight

    remove_index :targets, :starting_date
    remove_index :targets, :target_date
  end
end
