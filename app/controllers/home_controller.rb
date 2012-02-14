class HomeController < ApplicationController
  before_filter :authenticate_user!, :except => [:some_action_without_auth]
  require 'rubygems'
  require 'barby'
  require 'barby/outputter/png_outputter'
  require 'barby/barcode/code_128'
  require 'barby/barcode/code_39'

  def index
    if user_signed_in?
      @user = User.find(:all)
      @product = Product.find(:all, :conditions=>["user_id=?", current_user.id], :order => "created_at asc")
      @category = Category.new
       @product_add = Product.new
      @category_add= Category.find :all
     @product_category = Category.find(:all,:conditions=>["category_name=?",params[:cat_value]])

      # puts "strat ,,,,,,,,,,,,,,,,,,,,,,,,,,,,"
      #barcode = Barby::Code128B.new("1234534543")
      #File.open("#{Rails.root}/app/assets/images/barcode.png", 'wb') { |f|
      #  f.write barcode.to_png
      #
      #  #  puts "end,,,,,,,,,,,,,,,,,,,,,,,,,,,,"
      #}
      #p barcode.to_png

      #  include HasBarcode
      #  has_barcode :barcode,
      #    :outputter => :png,
      #    :type => :code_39,
      #    :value => Proc.new { |p| p.number }


      #
      #       barcode_value = "00000000000"
      #full_path = "barcode#{barcode_value}.png"
      #barcode = Barby::Code39.new(barcode_value)
      #File.open(full_path, 'w') { |f| f.write barcode.to_png(:margin => 3, :xdim => 2,     :height => 55) }
      #render :text => "#{barcode_value}.png has been generated."
    elsif !user_signed_in?
    end
     respond_to do |format|
        format.html
        format.js {render :json =>@product_category }
      end
  end


  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Successfully created User."
      redirect_to root_path
    else
      render :action => 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

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

  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      flash[:notice] = "Successfully deleted User."
      redirect_to root_path
    end
  end


end


