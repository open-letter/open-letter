class CreatePostcodesSuburbs < ActiveRecord::Migration
  def change
    create_table :postcodes_suburbs do |t|
      t.references :postcode, index: true
      t.references :suburb, index: true

      t.timestamps
    end
  end
end
