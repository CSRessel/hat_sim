class AddFreeSpotsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :free_spots, :integer
  end
end
