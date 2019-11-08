class CreateArticles < ActiveRecord::Migration[5.1]
  def change
    create_table :articles, id: :uuid do |t|
      t.string :name
      t.string :description
      t.integer :price
      t.string :image_url
      t.float :weight
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
