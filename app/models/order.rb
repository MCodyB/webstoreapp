class Order < ActiveRecord::Base
  attr_accessible :user_id, :product_id, :quantity

  belongs_to :user
  belongs_to :product

  validates :user_id, :product_id, presence: true
end