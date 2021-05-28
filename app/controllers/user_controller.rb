class UserController < ApplicationController
  before_action :authenticate_user!

  def index
    #not neccessary
  end

  def show
    @option = params[:option] || "bookings"
    @user = current_user
    @booked_costumes = Booking.where(user: current_user).map { |booking| booking.costume }

    if params[:confirm_booking]
      @booking_to_confirm = Booking.find(params[:confirm_booking].to_i)
      @booking_to_confirm.status = "accepted"
      @booking_to_confirm.save
    end

    if params[:reject_booking]
      @booking_to_reject = Booking.find(params[:reject_booking].to_i)
      @booking_to_reject.status = "rejected"
      @booking_to_reject.save
    end
  end
end

