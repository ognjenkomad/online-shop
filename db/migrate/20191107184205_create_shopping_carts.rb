class CreateShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    create_table :shopping_carts, id: :uuid do |t|
      t.integer :total_price
      t.references :user, foreign_key: true, type: :uuid
      t.references :address, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
