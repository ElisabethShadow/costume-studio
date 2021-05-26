class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    #not neccessary
  end

  def show
    @option = params[:option] || "bookings"
    @user = current_user

    if params[:confirm_booking]
      @booking_to_confirm = Booking.find(params[:confirm_booking].to_i)
      @booking_to_confirm.confirmation = true
      @booking_to_confirm.save
    end
  end
end
