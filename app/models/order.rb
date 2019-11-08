class Order < ApplicationRecord
  belongs_to :user
  belongs_to :address

  has_many :order_articles
  has_many :articles, through: :order_articles
end
