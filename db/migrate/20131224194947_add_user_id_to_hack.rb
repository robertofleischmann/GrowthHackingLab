class AddUserIdToHack < ActiveRecord::Migration
  def change
    add_column :hacks, :user_id, :integer
  end
end
