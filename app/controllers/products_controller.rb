class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    @first_item = true if session[:cart].empty?
    if session[:cart].include?(params[:id])
      flash[:notice] = t('.already_added')
    else
      session[:cart] << params[:id]
      session[:cart_total] += params[:price].to_i
    end
  end

end
