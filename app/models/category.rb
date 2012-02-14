class Category < ActiveRecord::Base
  belongs_to :product
  validates_uniqueness_of :category_name, :scope => [:parent_id]
end



