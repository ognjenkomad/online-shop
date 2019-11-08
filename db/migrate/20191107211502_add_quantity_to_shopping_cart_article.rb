class AddQuantityToShoppingCartArticle < ActiveRecord::Migration[5.1]
  def change
    add_column :shopping_cart_articles, :quantity, :integer, default: 1
  end
end
