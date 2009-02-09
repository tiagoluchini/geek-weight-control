class CreateLogs < ActiveRecord::Migration
  def self.up
    create_table :logs do |t|
      t.integer :user_id
      t.date :date
      t.float :weight
      t.float :trend
      t.integer :lock_version, :default => 0
      t.timestamps
    end
    
    add_index :logs, :user_id
    add_index :logs, :date
  end

  def self.down
    drop_table :logs
  end
end
