class CreateServers < ActiveRecord::Migration
  def change
    create_table :servers do |t|
      # Used in all servers
      t.string :address, null:false
      t.string :map
      t.string :region
      t.string :name
      t.integer :maxplayers
      t.boolean :dedicated

      # Dedicated only
      t.string :game
      t.string :password

      # Non dedicated only
      t.string :tags
      t.integer :flags, default:0
      t.integer :players, default:0
      t.integer :rating

      t.timestamps
    end
  end
end
