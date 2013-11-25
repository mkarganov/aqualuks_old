class OrderMailer < ActionMailer::Base
  default from: "from@example.com"

  def order_complete(order)
    @order = order
    mail(to: Conf.admin_email, subject: "New order has been created!")
  end
end
