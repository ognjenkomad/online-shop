class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses, id: :uuid do |t|
      t.string :street
      t.integer :street_number
      t.string :town
      t.string :state
      t.integer :post_code
      t.references :user, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
