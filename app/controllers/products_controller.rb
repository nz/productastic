class ProductsController < ApplicationController
  
  def index
    if params[:q] && params[:q].strip.present?
      @search = Product.search(params[:q])
    else
      @search = Product.search('*:*')
      @products = Product.scoped
    end
  end
  
end
