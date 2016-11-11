class CreateCharacters < ActiveRecord::Migration
  def change
    create_table :characters do |t|
      t.string :name, null: false
      t.integer :first_appearance_id, null: false

      t.timestamps
    end

    add_index :characters, :name
  end
end
