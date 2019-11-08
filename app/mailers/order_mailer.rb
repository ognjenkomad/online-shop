class OrderMailer < ApplicationMailer
  default from:'ogi.vgd94@gmail.com'
  def order(order)
    @order = order
    mail(to: @order.user.email, subject: "Order for #{@order.user.first_name} | Online-Shop")
  end
end