class AddServiceToProducts < ActiveRecord::Migration
  def change
    add_column :products, :service, :string

  end
end
