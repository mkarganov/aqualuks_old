class CataloguesController < ApplicationController
  def show
    @products = Product.all
  end
end
