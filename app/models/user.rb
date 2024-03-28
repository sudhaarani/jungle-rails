class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true ,uniqueness: { case_sensitive: false }
  validates :name, presence: true
  validates :password, presence: true, length: 8..15
  validates :password_confirmation, presence: true

  def self.authenticate_with_credentials(email, password) #class method
    email= email.strip.downcase
    user = User.find_by(email: email)
    if user && user.authenticate(password)
      return user
    end
  end
end
