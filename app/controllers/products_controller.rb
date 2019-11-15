class ProductsController < ApplicationController

  include CommonActions

  before_action :set_product, only: [:show]
  before_action :set_category, only: [:new, :create]
  before_action :set_parents #set_parentsはcontoroller/concerns/common_action.rbに記述

  def index
    @products = Product.all.order("created_at DESC")
  end

  def new
    @product = Product.new
    @product.images.build

  end

  def get_category_children
    @category_children = Category.find_by(name: "#{params[:parent_name]}", ancestry: nil).children
  end

  def get_category_grandchildren
    @category_grandchildren = Category.find("#{params[:child_id]}").children
  end

  def get_size_type
    selected_grandchild = Category.find("#{params[:grandchild_id]}") 
    if related_size_type_parent = selected_grandchild.size_types[0] 
      @size_types = related_size_type_parent.children 
    else
      selected_child = Category.find("#{params[:grandchild_id]}").parent 
      if related_size_type_parent = selected_child.size_types[0] 
          @size_types = related_size_type_parent.children 
      end
    end
  end

  def show
    @product = Product.find(params[:id])
    @images = @product.images.order("id DESC")
    @same_user_products = Product.where(user_id: @product.user_id).limit(6).order('created_at DESC')
    @same_category_products = Product.where(category_id: @product.category_id).limit(6).order('created_at DESC')
  end

  def create
    @product = Product.new(product_params)
    respond_to do |format|
      if @product.save
          params[:images][:url].each do |url|
            @product.images.create(url: url, product_id: @product.id)
          end
        format.html{redirect_to root_path}
      else
        @product.images.build
        format.html{render action: 'new'}
      end
    end
  end

  private


  def product_params
    params.require(:product).permit(:name, :description, :category_id, :status, :charge_burden, :prefecture, :send_days, :price, :size_type_id, :brand, images_attributes: [:id, :url]).merge(user_id: current_user.id)
  end

  def new_image_params
    params[:new_images].permit({images: []})
  end

  def set_category
    @category_parent_array = ["---"]
    Category.where(ancestry: nil).each do |parent|
      @category_parent_array << parent.name
    end
  end

end