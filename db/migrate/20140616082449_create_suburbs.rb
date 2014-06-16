class CreateSuburbs < ActiveRecord::Migration
  def change
    create_table :suburbs do |t|
      t.string :name
      t.string :state, limit: 3

      t.timestamps
    end
  end
end
