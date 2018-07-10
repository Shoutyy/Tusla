class Order < ApplicationRecord
  has_many :order_item
  before_save :update_total
  before_create :update_status

  def calculate_total
    self.order_item.collect { |item| item.product.price * item.quantity }.sum
  end

  private

  def update_status
    if self.status == nil?
      self.status = "In progress"
    end
  end

  def update_total
    self.total = calculate_total
  end

end
