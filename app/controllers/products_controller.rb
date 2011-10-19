class ProductsController < ApplicationController
  
  def index
    if params[:q] && params[:q].strip.present?
      @search = Product.search(params[:q])
    else
      @products = Product.scoped
    end
  end
  
end
