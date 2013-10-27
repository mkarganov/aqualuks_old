class CartsController < ApplicationController

  def show
    @products = Product.find(session[:cart].uniq)
  end

  def checkout
    @order = Order.create()
    parameters = params[:cart][:products]
    parse_cart_params(parameters)
    @parsed_params.each do |item|
      @order.order_products.create(product: Product.find(item[:product_id]), quantity: item[:quantity])
    end
  end

  def checkout_create

  end

end
