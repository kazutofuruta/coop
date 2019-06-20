class CreateKeyWords < ActiveRecord::Migration[5.2]
  def change
    create_table :key_words do |t|
      t.string :key_word
      t.integer :room_id

      t.timestamps
    end
  end
end
