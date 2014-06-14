class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.references :boundary, index: true
      t.references :boundary_postcode, index: true
      t.references :profile, index: true
      t.references :address, index: true
      t.string :honorific
      t.string :parlamentary_title
      t.string :parlamentary_title_short
      t.string :party

      t.timestamps
    end
  end
end
