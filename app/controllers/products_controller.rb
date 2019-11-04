class ProductsController < ApplicationController

  def index
  end

  def new
    @product = Product.new
    @category = Category.where(ancestry: nil)
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
