class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :characters, through: :favorite_characters
  has_many :games, through: :characters

  def password
    @password ||= BCrypt::Password.new(password_hash)
  end

  def password=(new_password)
    @password = BCrypt::Password.create(new_password)
    self.password_hash = @password
  end
end
