class User < ApplicationRecord
  validates :first_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :last_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email, uniqueness: true, presence: true, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/

  validates :password, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: { case_sensitive: true }, if: -> { new_record? || changes[:crypted_password] }

  has_many :articles
  has_many :addresses

  has_one :shopping_cart

  has_secure_password

  accepts_nested_attributes_for :addresses, allow_destroy: true
end
