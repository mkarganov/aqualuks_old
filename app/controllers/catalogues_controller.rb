class CataloguesController < ApplicationController
  def show
    @products = Product.by_category(params[:category_id]).search(params[:search]).order('name').page(params[:page]).per(2)
    @categories = Category.all
  end
end
