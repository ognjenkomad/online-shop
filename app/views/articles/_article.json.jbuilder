json.extract! article, :id, :name, :description, :price, :image_url, :weight, :user_id, :created_at, :updated_at
json.url article_url(article, format: :json)
