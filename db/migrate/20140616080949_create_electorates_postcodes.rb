class CreateElectoratesPostcodes < ActiveRecord::Migration
  def change
    create_table :electorates_postcodes do |t|
      t.references :electorate, index: true
      t.references :postcode, index: true
      t.float :electorate_percent

      t.timestamps
    end
  end
end
