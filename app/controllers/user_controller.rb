class UserController < ApplicationController
  before_action :authenticate_user!

  def index
  end

  def show
    @option = params[:option] || "bookings"
    @user = current_user
  end
end
