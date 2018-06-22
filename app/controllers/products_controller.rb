class ProductsController < ApplicationController
skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    search_options = []
    if params[:category].present?
      search_options << params[:category]
    end
    if params[:name].present?
      search_options << params[:name]
    end
    @search = params[:search]

    if search_options.blank?
      @products = Product.all
    else
      @products = Product.search_products(search_options)
    end
  end

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
    if @product.save
      redirect_to productpath(@product)
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
  end

  private

  def product_params
    params.require(:product).permit(:category, :name, :price, :description, :stock)
  end

end
