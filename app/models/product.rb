class Product < ApplicationRecord
belongs_to :user
belongs_to :category

validates :user, :category, :name, :price, :description, :stock, presence: true

end
