class ReviewsController < ApplicationController
  after_action :verify_authorized


  def create
    if current_user.admin?
      authorize :review
    end
    @product = Product.find(params[:product_id])
    @review = Review.new(review_params)
    @review.product = @product
    if @review.save
      redirect_to product_path(@product)
    end
  end

  private

  def review_params
    params.require(:review).permit(:content, :rating, :product_id)
  end
end
