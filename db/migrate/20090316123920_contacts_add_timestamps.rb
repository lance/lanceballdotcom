class ContactsAddTimestamps < ActiveRecord::Migration
  def self.up
    add_timestamps('contacts')
  end

  def self.down
    remove_timestamps('contacts')
  end
end
