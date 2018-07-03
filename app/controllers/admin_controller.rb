class AdminController < ApplicationController
  after_action :verify_authorized, unless: :devise_controller?

  def index
    authorize :admin
    @products = Product.all
  end

end



