class CreateBoundaryPostcodes < ActiveRecord::Migration
  def change
    create_table :boundary_postcodes do |t|
      t.integer :postcode
      t.string :suburb
      t.string :state, limit: 3
      t.float :percentage
      t.references :boundary, index: true

      t.timestamps
    end
  end
end
