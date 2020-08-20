class BookingsController < ApplicationController
  def new
  end

  def show
    @booking = Booking.find(params[:car_id])
    @review = Review.new
    # @start = DateTime.strptime(@booking.start_time, "%Y-%m-%d %H:%M:%S")
    # @end = DateTime.strptime(@booking.end_time, "%Y-%m-%d %H:%M:%S")
    @book_hours = ((@booking.end_time - @booking.start_time) / 3600).round
    @price = @book_hours * @booking.car.daily_rent_price
  end

  def create
    @booking = Booking.new(booking_params)
    @car = Car.find(params[:car_id])

    @booking.user = current_user
    @booking.car = @car
    if @booking.save
      redirect_to car_path(@car), notice: "You booked this car !"
    else
      redirect_to car_path(@car), alert: "Error !"
    end
  end

  private

  def booking_params
    params.require(:booking).permit(:start_time, :end_time)
  end
end
