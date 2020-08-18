class BookingsController < ApplicationController

  def new
    @booking = Booking.new
  end

  def create
    @booking = booking.new(booking_params)
    if @booking.save
      redirect_to cars_path(@booking)
    else
      render :new
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
