class CreateBoundaries < ActiveRecord::Migration
  def change
    create_table :boundaries do |t|
      t.string :name

      t.timestamps
    end
  end
end
