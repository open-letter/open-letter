class CreateElectorates < ActiveRecord::Migration
  def change
    create_table :electorates do |t|
      t.string :name

      t.timestamps
    end
    add_index :electorates, :name, unique: true
  end
end
