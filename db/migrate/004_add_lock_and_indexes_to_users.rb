class AddLockAndIndexesToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :lock_version, :integer, :default => 0
    
    add_index :users, :login, :unique => true
    add_index :users, :email, :unique => true
  end

  def self.down
    remove_column :users, :lock_version
    
    remove_index :users, :login
    remove_index :users, :email
  end
end
