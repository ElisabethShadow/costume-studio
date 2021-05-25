class BookingsController < ApplicationController

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @costume = Costumes.find(params[:costume_id])
    @booking = Booking.new
  end

  def create
    params[:booking][:date] = params[:booking][:date].to_datetime
    @booking = Booking.new(booking_params)
    @booking.user = current_user
    @costume_id = Costume.find(params[:costume_id])
    @booking.costume_id = @costume_id
    if @booking.save
      redirect_to booking_path(@booking)
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
    params.require(:booking).permit(:date)
  end
end
