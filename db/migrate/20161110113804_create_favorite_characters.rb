class CreateFavoriteCharacters < ActiveRecord::Migration
  def change
    create_table :favorite_characters do |t|
      t.integer :user_id, null: false
      t.integer :character_id, null: false

      t.timestamps
    end
  end
end
