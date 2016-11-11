class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :franchise, null: false
      t.string :platform, null: false

      t.timestamps
    end
  end
end
