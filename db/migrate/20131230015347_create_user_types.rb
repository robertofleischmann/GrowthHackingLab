class CreateUserTypes < ActiveRecord::Migration
  def change
    create_table :user_types do |t|
      t.string :name
      t.integer :uploads_needed

      t.timestamps
    end
  end
end
