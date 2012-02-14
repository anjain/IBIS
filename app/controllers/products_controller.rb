class ProductsController < ApplicationController
  require 'rubygems'
  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/barcode/code_128'
  require 'barby/barcode/code_39'

  # Show Product page
  def index
    @product = Product.find(:all, :conditions=>["user_id=?", current_user.id])
  end

  # Add Product page
  def new
    @product = Product.new
    @category= Category.find :all
    # puts params[:cat_value]
    @product_category = Category.find(:all, :conditions=>["category_name=?", params[:cat_value]])
    @user=User.find :all
    respond_to do |format|
      format.html
      format.js { render :json =>@product_category }
    end
  end

  #Create a new product
  def create
    @user= User.find_by_id(current_user.id)
    if ((!params[:category_subcategory].nil?) and (params[:category_subcategory]!=''))
      params[:product][:category]=params[:category_subcategory]
      params[:product][:purchased_date]="#{params[:M]}/#{params[:D]}/#{params[:Y]}"
      @product = @user.products.create(params[:product])
    elsif ((!params[:category].nil?)and(params[:category]!=''))
      params[:product][:category]=params[:category]
      params[:product][:purchased_date]="#{params[:M]}/#{params[:D]}/#{params[:Y]}"
      @product = @user.products.create(params[:product])
    else
      params[:product][:purchased_date]="#{params[:M]}/#{params[:D]}/#{params[:Y]}"
      @product = @user.products.create(params[:product])
    end
    redirect_to "/"

  end


  def show
    @product = Product.find(:all)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @post }
    end
  end

  # Edit Product
  def edit
    @product = Product.find(params[:id])
  end

  # Unique Product page
  def unique_product
    @product = Product.find(params[:id])
    @product_add = Product.new
    @category= Category.find :all
    @product_category = Category.find(:all, :conditions=>["category_name=?", params[:cat_value]])
    @user=User.find :all
    # Generate bar-code of a product
    #  barcode = Barby::Code128B.new("#{@product.product_name}_#{@product.id}.png")
    #    File.open("#{Rails.root}/app/assets/images/#{@product.product_name}_#{@product.id}.png", 'wb') { |f|
    #      f.write barcode.to_png
    #    }
    respond_to do |format|
      format.html
      format.js { render :json =>@product_category }
    end
  end

  # Update product
  def update
    @product = Product.find(params[:id])
    respond_to do |format|
      if @product.update_attributes(params[:product])
        format.html { redirect_to("/",
                                  :notice => 'Product was successfully updated.') }
        format.json { head :no_content }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @product.errors,
                             :status => :unprocessable_entity }
      end
    end
  end

  # Delete a product
  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end

  # Show sub-category of a product
  def show_category
    @product_category = Category.find(:all, :conditions=>["category_name=?", params[:cat_value]])
    respond_to do |format|
      format.js
    end
  end

  # Show sub-sub-category of a product
  def show_sub_category
    @product_category = Category.find(:all, :conditions=>["category_name=?", params[:cat_value]])
    respond_to do |format|
      format.js
    end
  end
end
