class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders, id: :uuid do |t|
      t.references :user, foreign_key: true, type: :uuid
      t.references :address, foreign_key: true, type: :uuid
      t.integer :total_price

      t.timestamps
    end
  end
end
