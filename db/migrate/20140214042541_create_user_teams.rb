class CreateUserTeams < ActiveRecord::Migration
  def change
    create_table :user_teams do |t|
      t.string :role

      t.integer :user_id, null:false
      t.integer :team_id, null:false

      t.boolean :accepted
      t.boolean :ready

      t.timestamps
    end
  end
end
