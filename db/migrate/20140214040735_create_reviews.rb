class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating_administration
      t.integer :rating_reliability
      t.integer :rating_speed
      t.integer :rating_other
      t.string :content
      t.string :title

      t.timestamps
    end
  end
end
