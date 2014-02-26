class CreateServers < ActiveRecord::Migration
  def change
    create_table :tf2_servers do |t|
      # Used in all servers
      t.string :address, null:false
      t.string :map
      t.string :region
      t.string :name
      t.integer :maxplayers
      t.boolean :dedicated
      t.integer :free_spots
      t.integer :players, default:0

      # Dedicated only
      t.string :game, default: "unspecified", null:false
      t.string :password

      # Non dedicated only
      t.string :tags
      t.integer :flags, default:0
      t.integer :rating

      t.timestamps
    end
  end
end
