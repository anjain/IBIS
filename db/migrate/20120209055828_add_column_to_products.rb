class AddColumnToProducts < ActiveRecord::Migration
  def change
    add_column :products, :serial_no, :string
    add_column :products, :description, :text
    add_column :products, :manufacturer, :string
    add_column :products, :model, :string
    add_column :products, :quantity, :integer
    add_column :products, :daily_rate, :float
    add_column :products, :weekly_rate, :float
    add_column :products, :weekend_rate, :float
    add_column :products, :late_fee, :float
    add_column :products, :purchased_date, :date
    add_column :products, :purchased_from, :string
    add_column :products, :purchased_price, :float
    add_column :products, :replacement_price, :float
    add_column :products, :weight, :float
    add_column :products, :linear_unit, :string
    add_column :products, :length, :float
    add_column :products, :width, :float
    add_column :products, :height, :float
    add_column :products, :notes, :text
    add_column :products, :expendable, :boolean
  end
end
