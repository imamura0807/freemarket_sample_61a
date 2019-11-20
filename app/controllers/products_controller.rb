class ProductsController < ApplicationController
  include CommonActions
  before_action :set_category, only: [:new, :create, :edit, :update]
  before_action :set_parents #set_parentsはcontoroller/concerns/common_action.rbに記述

  def index
    # women_category = Category.find_by(name: "レディース")
    @category = Product.all.order("created_at DESC")
    @category_women = Product.where(:category_id => 1..199)
    @category_man = Product.where(:category_id => 200..345)
    @category_soccer= Product.where(:category_id => 1024..1031)
    @category_snowboard= Product.where(:category_id => 1042..1053)
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

  def destroy
    @product = Product.find(params[:id])
    @product.destroy if @product.user_id == current_user.id
    redirect_to root_path
  end

  
  def edit
    @product = Product.find(params[:id])
    @profit = (@product.price * 0.9).round
    @fee = @product.price - @profit
    if @selected_size_type = @product.size_type
      @size_types_array = [{id: "---", size_type: "---"}]
      SizeType.find("#{@selected_size_type.id}").siblings.each do |size_type|
        size_type_hash = {id: "#{size_type.id}", size_type: "#{size_type.size_type}"}
        @size_types_array << size_type_hash
      end
    else
      @selected_size_type = nil
    end


    @selected_grandchild_category = @product.category
    @category_grandchildren_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_grandchild_category.id}").siblings.each do |grandchild| #siblingsで同じ階層の要素をすべて取得
      grandchildren_hash = {id: "#{grandchild.id}", name: "#{grandchild.name}"}
      @category_grandchildren_array << grandchildren_hash
    end
    @selected_child_category = @selected_grandchild_category.parent
    @category_children_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_child_category.id}").siblings.each do |child|
      children_hash = {id: "#{child.id}", name: "#{child.name}"}
      @category_children_array << children_hash
    end
    @selected_parent_category = @selected_child_category.parent
    @category_parents_array = [{id: "---", name: "---"}]
    Category.find("#{@selected_parent_category.id}").siblings.each do |parent|
      parent_hash = {id: "#{parent.id}", name: "#{parent.name}"}
      @category_parents_array << parent_hash
    end

  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to action: :show
    else
      redirect_to action: :edit, notice: "全項目入力できていません"
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