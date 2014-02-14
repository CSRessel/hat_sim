class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.string :title, null:false

      t.timestamps
    end
  end
end
