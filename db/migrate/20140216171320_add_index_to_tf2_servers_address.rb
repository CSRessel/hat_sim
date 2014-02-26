class AddIndexToServersAddress < ActiveRecord::Migration
  def change
    add_index :tf2_servers, :address, unique: true
  end
end
