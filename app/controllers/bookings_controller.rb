class BookingsController < ApplicationController

  def index
    @bookings = Booking.where(user_id: current_user)
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @costume = Costume.find(params[:costume_id])
    @booking = Booking.new
  end

  def create

    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @costume = Costume.find(params[:costume_id])
    @booking.costume = @costume
    raise
    if @booking.save
      redirect_to user_path(current_user)
    else
      render :new
    end
  end

  def update
    @booking = Booking.find(params[:id])
    @booking.confirmed = true || @booking.confirmed = false
    if @booking.save!
      redirect_to dashboard_path(current_user)
    end
  end

  def destroy
    @booking = Booking.find(params[:id])
    @booking.destroy
    redirect_to dashboard_path(current_user)
  end

  private

def booking_params
    params.require(:booking).permit(:check_in, :check_out)
  end

end
