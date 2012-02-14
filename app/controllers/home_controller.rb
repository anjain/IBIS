class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  require 'rubygems'
  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/barcode/code_128'
  require 'barby/barcode/code_39'

  # Show Product page as Home page
  def index
    if user_signed_in?
      @user = User.find(:all)
      @product = Product.find(:all, :conditions=>["user_id=?", current_user.id], :order => "created_at asc")
      @category = Category.new
      @product_add = Product.new
      @category_add= Category.find :all
      @product_category = Category.find(:all, :conditions=>["category_name=?", params[:cat_value]])
    elsif !user_signed_in?
    end
    respond_to do |format|
      format.html
      format.js { render :json =>@product_category }
    end
  end

 # Page to add new user
  def new
    @user = User.new
  end
 # Create a new user
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end
 # Edit user
  def edit
    @user = User.find(params[:id])
  end
 # Update user
  def update
    @user = User.find(params[:id])
    @temp=params[:user]
    x= @temp[:username]
    y=@temp[:email]
    z=Integer(@temp[:role_id])
    if (@user.update_attributes(:username=>x, :email=>y, :role_id=>z))
      flash[:notice] = "Successfully updated User."
      redirect_to root_path
    else
      render :action => 'edit'
      #set_flash_message :notice , :invalid   ,:scope=>:user
      flash[:notice]="Invalid username or email or role id"
    end
  end
 #Delete user
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end


end


