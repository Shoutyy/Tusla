class Product < ApplicationRecord
belongs_to :user
has_many :review, dependent: :destroy
end
