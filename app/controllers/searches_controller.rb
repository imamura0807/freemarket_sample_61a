class SearchesController < ApplicationController
  include CommonActions
  before_action :set_parents #set_parentsはcontoroller/concerns/common_action.rbに記述
  def index
    @products     = Product.where('name LIKE(?)', "%#{params[:keyword]}%").order("created_at DESC") unless params[:keyword].empty?
    @new_products = Product.order("created_at DESC") unless @products.present?
    @keyword   = params[:keyword]
  end
end