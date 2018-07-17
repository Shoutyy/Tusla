class UsersController < ApplicationController
  after_action :verify_authorized


  def destroy
    @user = User.find(params[:id])
    @user.destroy
    authorize @user
    redirect_to "/admin"
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    @user.save
    redirect_to '/admin'
    authorize :user
  end

  private

  def user_params
    params.require(:user).permit(:seller)
  end
end
