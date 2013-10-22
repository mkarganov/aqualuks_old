class CartsController < ApplicationController

  def show
    @products = []
    session[:cart].each do |id|
      @products << Product.find(id)
    end
  end

end
