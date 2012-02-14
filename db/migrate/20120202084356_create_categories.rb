class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :category_name
      t.integer :parent_id, :default => 0
      t.references :product

      t.timestamps
    end
    add_index :categories, :product_id
  end
end
