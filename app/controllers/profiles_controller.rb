class ProfilesController < ApplicationController
  after_action :verify_authorized

  def index
    @tab = params["tab"]
    authorize @profiles
  end

  def show
    authorize :profile, :show?
  end

  def admin?
    @current_user.admin = user.where(admin: true)
  end
end
