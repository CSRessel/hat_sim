class CreateStats < ActiveRecord::Migration
  def change
    create_table :stats do |t|
      t.integer :tot_hours
      t.integer :tot_kills
      t.integer :tot_points

      t.integer :class_scout_hours
      t.integer :class_scout_kills
      t.integer :class_scout_points
      t.integer :class_soldier_hours
      t.integer :class_soldier_kills
      t.integer :class_soldier_points
      t.integer :class_pyro_hours
      t.integer :class_pyro_kills
      t.integer :class_pyro_points
      t.integer :class_demo_hours
      t.integer :class_demo_kills
      t.integer :class_demo_points
      t.integer :class_heavy_hours
      t.integer :class_heavy_kills
      t.integer :class_heavy_points
      t.integer :class_engineer_hours
      t.integer :class_engineer_kills
      t.integer :class_engineer_points
      t.integer :class_medic_hours
      t.integer :class_medic_kills
      t.integer :class_medic_points
      t.integer :class_sniper_hours
      t.integer :class_sniper_kills
      t.integer :class_sniper_points
      t.integer :class_spy_hours
      t.integer :class_spy_kills
      t.integer :class_spy_points

      t.string  :most_played_class
      t.string  :most_successful_class

      t.ingeger :user_id, null:false

      t.timestamps
    end
  end
end
