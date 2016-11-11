class Game < ActiveRecord::Base
  # Remember to create a migration!
  has_many :characters, foreign_key: :first_appearance_id
end
