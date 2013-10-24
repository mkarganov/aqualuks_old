module ProductsHelper
  def total_price(products)
    products.map(&:price).inject {|price, total| total + price }
  end
end
