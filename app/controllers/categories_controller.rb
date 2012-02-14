class CategoriesController < ApplicationController
  def index
  end
  # Edit Category page
  def edit
    @category = Category.find(params[:id])
  end
  # Update Category attributes
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
  # Delete a category
  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    respond_to do |format|
      format.html { redirect_to "/" }
    end
  end
end
