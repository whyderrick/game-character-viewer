class Character < ActiveRecord::Base
  # Remember to create a migration!
  has_many :fans, through: :favorite_characters, class_name: :User
  belongs_to :first_appearance, class_name: :Game
end
