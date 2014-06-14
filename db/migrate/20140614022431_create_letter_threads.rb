class CreateLetterThreads < ActiveRecord::Migration
  def change
    create_table :letter_threads do |t|
      t.boolean :closed
      t.text :comments

      t.timestamps
    end
  end
end
