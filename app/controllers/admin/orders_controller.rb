class Admin::OrdersController < AdminApplicationController
  before_action :find_order, except: :index

  def index
    @orders = Order.page(params[:page]).per(15)
  end

  def update
    if @order.update_attributes(order_params)
      flash[:notice] = t('.order_updated')
      redirect_to admin_orders_path
    else
      render :edit
    end
  end

  def destroy
    @order.destroy
    flash[:notice] = t('.order_removed')
    redirect_to admin_orders_path
  end

  def add_products
    @products = Product.where.not(id: @order.products.map(&:id))
    @order_products = @order.order_products.build(@products.map{|p| {product_id: p.id}})
  end

  def find_products
    @products = Product.search(params[:search])
  end

  private

  def order_params
    params.require(:order).permit(:customer_name, :address, :phone, :email, :comment, :total, :status,
                                  order_products_attributes: [:id, :product_id, :quantity, :_destroy], added_product_ids: [])
  end

  def find_order
    @order = Order.find(params[:id])
  end

end
