class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null:false
      t.string :game, null:false, default:'unspecified'
      t.integer :captain
      t.boolean :temporary
      t.integer :tf2_server_id

      t.timestamps
    end
  end
end
