module OrdersHelper
  def set_class(order)
    case order.status
    when 1
      'success'
    when 2
      'danger'
    end
  end
end
