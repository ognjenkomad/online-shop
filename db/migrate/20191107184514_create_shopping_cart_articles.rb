class CreateShoppingCartArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_cart_articles, id: :uuid do |t|
      t.references :article, foreign_key: true, type: :uuid
      t.references :shopping_cart, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
