class DeleteShopCards < ActiveRecord::Migration[5.1]
  def change
    drop_table :shopping_cards
  end
end
