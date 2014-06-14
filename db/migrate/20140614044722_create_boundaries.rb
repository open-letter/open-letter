class CreateBoundaries < ActiveRecord::Migration
  def change
    create_table :boundaries do |t|
      t.string :name

      t.timestamps
    end
    add_index :boundaries, :name, unique: true
  end
end
