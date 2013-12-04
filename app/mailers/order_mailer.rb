class OrderMailer < ActionMailer::Base
  default from: "octopus.marketplace@gmail.com"

  def admin_order_notification
    mail(to: Conf.admin_email, subject: "New order has been created!")
  end

  def user_order_notification(order)
    @order = order
    mail(to: @order.email, subject: 'Order Confirmed')
  end
end
