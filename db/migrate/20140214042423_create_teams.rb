class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name, null:false
      t.string :game, null:false, default:'unspecified'
      t.integer :captain, null:false

      t.timestamps
    end
  end
end
