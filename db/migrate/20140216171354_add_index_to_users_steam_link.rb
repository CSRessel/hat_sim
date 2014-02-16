class AddIndexToUsersSteamLink < ActiveRecord::Migration
  def change
    add_index :users, :steam_link, unique: true
  end
end
