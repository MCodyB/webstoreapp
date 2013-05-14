class CartsController < ApplicationController
  before_filter :signed_in_user, only: [:update, :destroy]

  def new
    @orders = []
    session[:cart].each do |product_id, quantity|
      @orders << Order.new(user_id: current_user.id,
                           product_id: product_id,
                           quantity: quantity)
    end
  end

  def update
    session[:cart] ||= {}
    params[:cart].each do |product_id, change|
      session[:cart][product_id] ||= 0
      session[:cart][product_id] += change.to_i
    end
    redirect_to products_path, notice: "Cart updated!"
  end

  def destroy
    session[:cart] = nil
    redirect_to products_path, notice: "Cart emptied."
  end

  private

  def signed_in_user
    redirect_to signin_url, notice: "Only signed in users" unless signed_in?
  end
end