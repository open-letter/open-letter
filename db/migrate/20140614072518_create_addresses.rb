class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :state, limit: 3
      t.string :street
      t.integer :postcode
      t.string :suburb
      t.string :country
      t.string :phone
      t.references :profile, index: true

      t.timestamps
    end
  end
end
