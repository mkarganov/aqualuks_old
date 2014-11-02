class WelcomeController < ApplicationController
  layout false, only: [:fresh]

  def index
    @featured_products = Product.where(featured: true)
    @popular_products = Product.where(popular: true)
    @categories = Category.all
  end

  def fresh
  end
end
