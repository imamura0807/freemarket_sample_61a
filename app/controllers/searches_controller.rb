class SearchesController < ApplicationController
  def index
    @products     = Product.where('name LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC") unless params[:keyword].empty?
    @new_products = Product.order("created_at DESC") unless @products.present?
    @keyword   = params[:keyword]
  end
end