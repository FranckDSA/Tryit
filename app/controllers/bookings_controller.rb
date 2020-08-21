class BookingsController < ApplicationController
  def new
  end

  def show
    @booking = Booking.find(params[:car_id])
    @review = Review.new
    @booking.price
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])

    @booking.user = current_user
    @booking.car = @car
    if @booking.valid? && @booking.end_time > @booking.start_time
      @booking.save
      redirect_to car_path(@car), notice: "You booked this car !"
    else
      redirect_to car_path(@car), alert: "Error, please try again!"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
