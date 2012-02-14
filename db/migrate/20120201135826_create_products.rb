class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string  :product_name
      t.string  :category
      t.string  :location
      t.integer :price
      t.text :available

      t.references :user

      t.timestamps
    end
    add_index :products, :user_id
  end
end
