class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def add_to_cart
    if session[:cart].include?(params[:id])
      flash[:notice] = t('.already_added')
    else
      session[:cart] << params[:id]
      @new_item = true
    end
  end

end
