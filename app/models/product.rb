class Product < ActiveRecord::Base
  # validates :product_name,  :presence => true
  #validates :price, :presence => true
  belongs_to :user
  has_many :categories
  has_attached_file :photo
end
