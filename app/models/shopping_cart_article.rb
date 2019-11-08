class ShoppingCartArticle < ApplicationRecord
  belongs_to :article
  belongs_to :shopping_cart
end
