class Admin::ProductsController < AdminApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.create(product_params)
    redirect_to admin_products_path
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update(product_params)
      redirect_to admin_products_path
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy

    redirect_to admin_products_path
  end

  private

  def product_params
    params.require(:product).permit(:name, :description, :price, product_images_attributes: [:image], category_ids: [])
  end

  def find_product
    @category  = Product.find(params[:id])
  end
end
