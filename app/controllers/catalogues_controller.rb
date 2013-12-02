class CataloguesController < ApplicationController

  def show
    @products = Product.order(sort_column + ' ' + sort_direction).by_category(params[:category_id]).search(params[:search]).page(params[:page]).per(12)
    @categories = Category.all
  end

  private

  def sort_column
    Product.column_names.include?(params[:sort]) ? params[:sort] : 'name'
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : 'asc'
  end
end
