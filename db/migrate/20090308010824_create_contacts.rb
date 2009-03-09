class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table "contacts", :force => true do |t|
      t.column :name,                      :string, :limit => 40
      t.column :email,                     :string, :limit => 100
      t.column :message,                   :text
    end
  end

  def self.down
    drop_table "contacts"
  end
end
