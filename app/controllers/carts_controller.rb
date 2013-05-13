class CartsController < ApplicationController
  def update
    cookies.permanent[:cart] ||= Hash.new(0)
    params[:cart].each do |product_id, change|
      cookies.permanent[:cart][product_id] += change
    end
  end

  def destroy
    cookies.delete[:cart]
  end
end