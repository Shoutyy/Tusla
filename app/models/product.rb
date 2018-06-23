class Product < ApplicationRecord
  mount_uploader :photo, PhotoUploader

include PgSearch
pg_search_scope :search_products,
against: [ :name ],
associated_against: {
  category: [ :name ]
},
using: {
  tsearch: { prefix: true }
}

belongs_to :user
belongs_to :category

validates :user, :category, :name, :price, :description, :stock, presence: true

end
