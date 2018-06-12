class User < ApplicationRecord

  def user_params
    params.require(:User).permit(:name, :email,:password, :password_confirmation)
  end

  has_secure_password

  attr_accessor :password, :password_confirmation

  before_save { |user| user.email = email.downcase }

  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence:   true,
            format:     { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
end


#User.create(name: "Michael Hartl", email: "mhartl@example.com",password: "foobar", password_confirmation: "foobar")}