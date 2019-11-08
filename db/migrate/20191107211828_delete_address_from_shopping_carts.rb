class DeleteAddressFromShoppingCarts < ActiveRecord::Migration[5.1]
  def change
    remove_column :shopping_carts, :address_id
  end
end
