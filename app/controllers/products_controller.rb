class ProductsController < ApplicationController

  def index
    @products = Product.all.limit(10)
    # binding.pry
    @images = Image.all.limit(10)
    # binding.pry
  end

  def new
    @product = Product.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
    def get_category_children
      @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
    end
    def get_category_grandchildren
      @category_grandchildren = Category.find("#{params[:child_id]}").children
    end
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to controller: :products, action: :index
    else
      render "new"
    end
  end

  private

  def product_params
    params[:product].permit(:name, :description, :status, :charge_burden, :prefecture, :send_days, :price, :category)
    # params[:product].permit(:name, :description, :status, :charge_burden, :prefecture, :send_days, :price, :category).merge(user_id: current_user.id)
  end
  
end
