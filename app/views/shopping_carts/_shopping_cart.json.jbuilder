json.extract! shopping_cart, :id, :user_id, :total_price, :address_id, :created_at, :updated_at
json.url shopping_cart_url(shopping_cart, format: :json)
