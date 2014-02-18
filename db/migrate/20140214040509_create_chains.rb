class CreateChains < ActiveRecord::Migration
  def change
    create_table :chains do |t|
      t.string :title, null:false
      t.string :body, null:false

      t.integer :subforum_id, null:false
      t.integer :user_id, null:false

      t.timestamps
    end
  end
end
