class CreateHacks < ActiveRecord::Migration
  def change
    create_table :hacks do |t|
      t.string :description
      t.string :photo

      t.timestamps
    end
  end
end
