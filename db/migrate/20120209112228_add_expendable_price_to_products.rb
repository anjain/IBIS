class AddExpendablePriceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :expendable_price, :float

  end
end
