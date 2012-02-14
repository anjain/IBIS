module ProductsHelper

  def showtax
    @taxn = Category.find[:all]
    return @taxn
  end

  def find_subcategory(taxon)
    @category_product = Category.find(:all,:conditions=>["parent_id=? ",taxon])
    return @category_product
  end

  def find_category_by_name(category_name)
    category = Category.find(:all,:conditions=> ["category_name=?",category_name])
    return category
  end
  def find_sub_category_by_id(id)
    sub_category = Category.find(:all,:conditions=> ["id=?",id])
    return sub_category
  end

  #def productbyCategory(taxon)
  #
  #   @searcher = Spree::Config.searcher_class.new(params.merge(:taxon => taxon))
  #   @products = @searcher.retrieve_products.limit(2)
  #
  #   return @products
  #
  #end
end
