class Article < ApplicationRecord
  belongs_to :user, optional: true
  has_many :shopping_cart_articles
  has_and_belongs_to_many :shopping_cart

  def self.search_by_name(name)
    where("name ilike '%#{name}%'")
  end
end
