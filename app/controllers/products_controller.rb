class ProductsController < ApplicationController

  before_action :set_item_form_collction_select, only: [:new, :create]

  def index
  end

  def new
    @product = Product.new
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
        @category_parent_array << parent.name
    end
  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end
  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size
    @selected_grandchild = Category.find("#{params[:grandchild_id]}") 
  end

  def show
  end

  def create
    @product = Product.new(product_params)
    if @product.save && new_image_params[:images][0] != ""
      new_image_params[:images].each do |image|
        @product.images.create(image: image, product_id: @product.id)
      end
      redirect_to root_path
    else
      render "new"
    end
  end

  private

  def product_params
    params[:product].permit(:name, :description, :status, :charge_burden, :prefecture, :send_days, :price, :category_id)
    # params[:product].permit(:name, :description, :status, :charge_burden, :prefecture, :send_days, :price, :category).merge(user_id: current_user.id)
  end

  def set_item_form_collction_select
    @category_parent_array = Category.where(ancestry: nil)
  end

  def new_image_params
    params[:new_images].permit({images: []})
  end
end
