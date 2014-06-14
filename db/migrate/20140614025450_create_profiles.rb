class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :screen_name
      t.string :title, limit: 10
      t.string :gender, limit: 2
      t.string :dob
      t.string :profile_img

      t.timestamps
    end
  end
end
