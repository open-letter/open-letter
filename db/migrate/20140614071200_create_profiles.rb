class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :preferred_name
      t.string :first_name
      t.string :last_name
      t.string :screen_name
      t.string :title
      t.string :gender, limit: 2
      t.string :dob
      t.string :profile_img

      t.timestamps
    end
  end
end
