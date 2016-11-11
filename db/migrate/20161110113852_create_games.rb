class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :title, null: false
      t.string :description
      t.string :franchise
      t.string :image, null: false
      t.string :platform, null: false

      t.timestamps
    end
  end
end
