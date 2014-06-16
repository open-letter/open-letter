class CreateRepresentatives < ActiveRecord::Migration
  def change
    create_table :representatives do |t|
      t.references :electorate, index: true
      t.references :profile, index: true
      t.references :address, index: true
      t.string :courtesy_title
      t.string :honorific
      t.string :parlamentary_titles
      t.string :parlamentary_titles_short
      t.string :party

      t.timestamps
    end
  end
end
