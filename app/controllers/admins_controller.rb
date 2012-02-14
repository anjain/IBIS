class AdminsController < ApplicationController
  def index
    if !user_signed_in?
      flash[:notice]="You are not signed in."
      redirect_to "/"
    else
      @admin=User.find_by_id(current_user.id)
      if user_signed_in? and @admin.admin!="admin"
        flash[:notice]="You do not have permission to access admin panel."
        redirect_to "/"
      else
        user_signed_in? and @admin.admin=="admin"
        respond_to do |format|
          format.html
        end
      end
    end
  end

def show
  @category = Category.find(:all)
  respond_to do |format|
    format.html  # show.html.erb
   # format.json  { render :json => @post }
  end
  end


  def new
       @category = Category.new
       @user=User.find :all
       respond_to do |format|
         format.html
       end
     end


   #Create a new category

   def create
      @user= User.find_by_id(current_user.id)
      # product=Product.find_by_id(params[:id])
      @category = Category.new(params[:category])

  respond_to do |format|
    if @category.save
      format.html  { redirect_to("/admins",
                    :notice => 'Category was successfully created.') }
      format.json  { render :json => @category,
                    :status => :created, :location => @category }
    else
      format.html  { render :action => "new" }
      format.json  { render :json => @category.errors,
                    :status => :unprocessable_entity }
    end
  end
   end

    def edit
  @category = Category.find(params[:id])
    end

   def update
  @product = Product.find(params[:id])
  respond_to do |format|
    if @product.update_attributes(params[:product])
      format.html  { redirect_to("/",
                    :notice => 'Product was successfully updated.') }
      format.json  { head :no_content }
    else
      format.html  { render :action => "edit" }
      format.json  { render :json => @product.errors,
                    :status => :unprocessable_entity }
    end
  end
   end

  def destroy
  @category = Category.find(params[:id])
  @category.destroy

  respond_to do |format|
    format.html { redirect_to "/" }
   # format.json { head :no_content }
  end
  end


    def category_management
       #@category = Category.new
       #@user=User.find :all
       respond_to do |format|
         format.html
       end
     end

end
