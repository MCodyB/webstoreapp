class Product < ActiveRecord::Base
  attr_accessible :name, :price

  has_many :orders
  has_many :users, through: :orders

  validates :name, :price, :presence => true

  def cost
    self.price/100.0
  end
end