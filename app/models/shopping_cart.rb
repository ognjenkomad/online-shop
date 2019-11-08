class ShoppingCart < ApplicationRecord
  belongs_to :user, optional: true

  has_many :shopping_cart_articles
  has_and_belongs_to_many :articles
end
