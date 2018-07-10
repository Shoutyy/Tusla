class OrderItemsController < ApplicationController

  def create
    @order = current_order
    @item = @order.order_item.new(item_params)
    @order.save
    session[:order_id] = @order.id
    redirect_to products_path
    authorize :order_item
  end

  def destroy
    @order = current_order
    @item = @order.order_item.find(params[:id])
    @item.destroy
    @order.save
    redirect_to cart_path
    authorize :order_item
  end

  def update
    @order = current_order
    @item = @order.order_item.find(params[:id])
    @item.update_attributes(item_params)
    @item = @order.order_item
    @order.save
    redirect_to cart_path
    authorize :order_item
  end

  private

  def item_params
    params.require(:order_item).permit(:quantity, :product_id)
  end
end
