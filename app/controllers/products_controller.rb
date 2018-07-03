class ProductsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @products = policy_scope(Product)
    search_options = []
    if params[:category].present?
      search_options << params[:category]
    end
    if params[:name].present?
      search_options << params[:name]
    end
    @search = params[:search]

    if search_options.blank?
      @products = Product.where(published: true).all
    else
      @products = Product.where(published: true).search_products(search_options)
    end
  end

  def show
    @product = Product.where(published: true).find(params[:id])
    authorize @product
  end

  def new
    @product = Product.new
    authorize @product
  end

  def create
    @product = Product.new(product_params)
    authorize @product
    @product.user = current_user
    @product.save
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      @product.save
      redirect_to product_path(@product)
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    authorize @product
    redirect_to "/admin"
  end

  private

  def product_params
    params.require(:product).permit(:category_id, :published, :name, :price, :description, :photo, :stock)
  end

end
