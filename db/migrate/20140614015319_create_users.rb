class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.references :profile, index: true
      t.references :address, index: true

      t.timestamps
    end
  end
end
