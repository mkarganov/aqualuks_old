class Admin::ProductsController < AdminApplicationController

  before_filter :find_product, only: [:edit, :update, :destroy]

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    if @product.errors.any?
      render :new
    else
      redirect_to admin_products_path
    end
  end

  def update
    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product.destroy

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, product_images_attributes: [:id, :image, :_destroy], category_ids: [])
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
