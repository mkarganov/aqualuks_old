class Admin::CategoriesController < AdminApplicationController

  before_action :find_category, only: [:edit, :update, :destroy]
  # before_action :sub_categories, only: [:new, :edit]

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
    @categories = Category.all
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
    params.require(:category).permit(:title, sub_category_ids: [])
  end

  def find_category
    @category  = Category.find(params[:id])
  end

  # def sub_categories #TODO Refactor to use sql query
  #   @categories = Category.all.reject{ |cat| cat.parent_id? || cat.sub_categories.present? }
  # end
end
