class CartsController < ApplicationController

  def show
    @products = Product.find(session[:cart].uniq)
  end

  def checkout_new
    binding.pry
    @products = Product.find(session[:cart].uniq)
    @order.products = @products
  end

  def checkout_create

  end

end
