class User < ApplicationRecord
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  authenticates_with_sorcery! do |config|
    config.authentications_class = Authentication
  end

  has_many :cards, dependent: :destroy
  has_many :authentications, dependent: :destroy
  accepts_nested_attributes_for :authentications

  validates :password, length: { in: 6..16 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, format: { with: VALID_EMAIL_REGEX, message: 'email has invalid format' }

end
