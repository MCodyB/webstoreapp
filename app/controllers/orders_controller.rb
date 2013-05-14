class OrdersController < ApplicationController

  def show
    @order = Order.find(:id)
  end

   def create
    total_cost = 0
    params[:orders].size.times do |i|
      order = Order.find_or_create_by_product_id_and_user_id(
                          params[:product_ids][i],
                          params, params[:user_id][i]
      )
      total_cost += Product.find(params[:product_id]).cost
      order.save
    end
    session[:total_cost] = total_cost
    redirect_to order_url
  end
end