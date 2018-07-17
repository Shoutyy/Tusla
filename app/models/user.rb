class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  include PgSearch
  pg_search_scope :search_users,
  against: [ :last_name, :first_name, :email ],
  using: {
    tsearch: { prefix: true }
  }

  has_many :product, :dependent => :delete_all
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
