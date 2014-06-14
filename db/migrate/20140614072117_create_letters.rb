class CreateLetters < ActiveRecord::Migration
  def change
    create_table :letters do |t|
      t.references :letter_thread, index: true
      t.references :category, index: true
      t.references :sender, index: true
      t.references :receiver, index: true
      t.string :subject
      t.text :content
      t.references :response, index: true
      t.integer :satisfaction
      t.integer :tone
      t.datetime :reminder_sent_at
      t.datetime :sent_at

      t.timestamps
    end
  end
end
