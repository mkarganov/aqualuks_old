class WelcomeController < ApplicationController
  def index
    @featured_products = Product.where(featured: true)
    @popular_products = Product.where(popular: true)
    @categories = Category.all
  end
end
