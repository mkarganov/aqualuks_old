class CataloguesController < ApplicationController
  def show
    @products = Product.search(params[:search])
  end
end
