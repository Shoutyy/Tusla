class CategoriesController < ApplicationController


  def create
    @category = Category.new(product_params)
    @category.save
  end


  def destroy
    @category = Category.find(params[:id])
    @category.destroy
  end

  private

  def product_params
    params.require(:category).permit(:name)
  end

end
