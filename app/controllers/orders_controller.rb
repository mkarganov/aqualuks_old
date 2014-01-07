class OrdersController < ApplicationController

  before_filter :find_order, only: [:edit, :update, :destroy]

  def new
    @order = Order.new
    @products = Product.find(session[:cart].uniq)
    @order_products = @order.order_products.build(@products.map{|p| {product_id: p.id}})
  end

  def create
    @order = Order.new(order_params)
    @order.user = current_user if current_user
    @order.save(validate: false)
    redirect_to edit_order_path(@order)
  end

  def update
    if @order.update(order_params)
      OrderMailer.admin_order_notification.deliver
      # OrderMailer.user_order_notification(@order).deliver
      session[:cart] = []
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    redirect_to root_path
  end

  def remove
    @id = params[:id]
    session[:cart].delete(@id)
  end

  def empty_cart
    session[:cart] = []
    session[:cart_total] = 0
    redirect_to root_path
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :address, :phone, :email, :comment, order_products_attributes: [:product_id, :quantity])
  end

  def find_order
    @order = Order.find(params[:id])
  end

end
