class AdminController < ApplicationController
  after_action :verify_authorized, unless: :devise_controller?

  def index
    authorize :admin
    @products = Product.all
    @users = User.all
    search_options = []
    if params[:name].present?
      search_options << params[:name]
    end
    if params[:last_name].present?
      search_options << params[:last_name]
    end
    if params[:first_name].present?
      search_options << params[:first_name]
    end
    if params[:email].present?
      search_options << params[:email]
    end
    @search = params[:search]
    if search_options.blank?
      @products = Product.all
      @users = User.all
    else
      @products = Product.search_products(search_options)
      @users = User.search_users(search_options)
    end
  end

  def show
    authorize :admin
    @product = Product.find(params[:id])
  end
end



