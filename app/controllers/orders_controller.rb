class OrdersController < ApplicationController

  def new
    @order = Order.new
    @products = Product.find(session[:cart].uniq)
    @order_products = @order.order_products.build(@products.map{|p| {product_id: p.id}})
    binding.pry
  end

  def create
    @order = Order.create(order_params)
  end

  def order_params
    params.require(:order).permit(order_products_attributes: [:id, :quantity])
  end

end
