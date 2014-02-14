class CreateSubforums < ActiveRecord::Migration
  def change
    create_table :subforums do |t|
      t.string :name, null:false

      t.timestamps
    end
  end
end
