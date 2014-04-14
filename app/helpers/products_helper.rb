module ProductsHelper
  def total_price(products)
    products.map(&:price).inject {|price, total| total + price }
  end

  def price_with_currency(price)
    if price == 0
      "уточняйте"
    else
      "#{price} " << t('shared.product.currency')
    end
  end
end
