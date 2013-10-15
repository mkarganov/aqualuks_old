class Admin::CategoriesController < AdminApplicationController

  before_filter :find_category, only: [:edit, :update, :destroy]
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.delete

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title)
  end

  def find_category
    @category  = Category.find(params[:id])
  end
end
