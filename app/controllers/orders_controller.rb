class OrdersController < ApplicationController

  def new
    @order = Order.new
    @products = Product.find(session[:cart].uniq)
    @order_products = @order.order_products.build(@products.map{|p| {product_id: p.id}})
  end

  def create
    @order = Order.new(order_params)
    @order.save(validate: false)
    redirect_to edit_order_path(@order)
  end

  def edit
    @order = Order.find(params[:id])
  end

  def update
    @order = Order.find(params[:id])
    if @order.update(order_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def order_params
    params.require(:order).permit(:customer_name, :address, :phone, :comment, order_products_attributes: [:product_id, :quantity])
  end

end
