class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    session[:cart] << params[:id]
    redirect_to root_path
  end

end
