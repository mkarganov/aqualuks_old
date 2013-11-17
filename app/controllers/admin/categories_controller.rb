class Admin::CategoriesController < AdminApplicationController

  before_action :find_category, only: [:edit, :update, :destroy]
  before_action :available_parrents, only: [:new, :edit]

  def index
    @main_categories = Category.where(parent_id: nil)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.create(category_params)
    redirect_to admin_categories_path
  end

  def edit
    @categories = @categories.without_current(@category)
  end

  def update
    if @category.update(category_params)
      redirect_to admin_categories_path
    else
      render :edit
    end
  end

  def destroy
    @category.destroy

    redirect_to admin_categories_path
  end

  private

  def category_params
    params.require(:category).permit(:title, :parent_id)
  end

  def find_category
    @category  = Category.find(params[:id])
  end

  def available_parrents
    @categories = Category.parrents
  end

end
