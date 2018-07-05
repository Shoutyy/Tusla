class UsersController < ApplicationController
  after_action :verify_authorized

 def destroy
    @user = User.find(params[:id])
    @user.destroy
    authorize @user
    redirect_to "/admin"
  end
end
