class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :content, null:false

      t.integer :chain_id, null:false
      t.ingeger :user_id, null:false

      t.timestamps
    end
  end
end
