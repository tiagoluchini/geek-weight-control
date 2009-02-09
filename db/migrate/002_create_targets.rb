class CreateTargets < ActiveRecord::Migration
  def self.up
    create_table :targets do |t|
      t.integer :user_id
      t.date :date
      t.float :weight
      t.integer :lock_version, :default => 0
      t.timestamps
    end
  
    add_index :targets, :user_id
    add_index :targets, :date
  end
  
  def self.down
    drop_table :targets
  end
end
