class AddIndexToServersAddress < ActiveRecord::Migration
  def change
    add_index :servers, :address, unique: true
  end
end
