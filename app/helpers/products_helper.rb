module ProductsHelper

  def showtax
    @taxn = Category.find[:all]
    return @taxn
  end
  # Find sub-category by id
  def find_subcategory(taxon)
    @category_product = Category.find(:all,:conditions=>["parent_id=? ",taxon])
    return @category_product
  end
   # find sub-category by name
  def find_category_by_name(category_name)
    category = Category.find(:all,:conditions=> ["category_name=?",category_name])
    return category
  end
  # find sub-sub-category by id
  def find_sub_category_by_id(id)
    sub_category = Category.find(:all,:conditions=> ["id=?",id])
    return sub_category
  end
end
