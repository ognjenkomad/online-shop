class CreateOrderArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :order_articles, id: :uuid do |t|
      t.references :order, foreign_key: true, type: :uuid
      t.references :article, foreign_key: true, type: :uuid
      t.integer :quantity
      t.integer :total_price

      t.timestamps
    end
  end
end
