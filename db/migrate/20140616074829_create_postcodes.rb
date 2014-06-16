class CreatePostcodes < ActiveRecord::Migration
  def change
    create_table :postcodes do |t|
      t.integer :postcode

      t.timestamps
    end
    add_index :postcodes, :postcode, unique: true
  end
end
