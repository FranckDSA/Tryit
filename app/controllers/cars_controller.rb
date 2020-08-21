class CarsController < ApplicationController
  def index
    @cars = Car.geocoded
    if params[:car][:address].present? && params[:search][:category] != [""]
      @cars = Car.where("category in ('#{params[:search][:category].join("','")}')").near(params[:car][:address], 10)
    elsif params[:search][:category] != [""]
      @cars = Car.where("category in ('#{params[:search][:category].join("','")}')")
    elsif params[:car][:address] != ""
      @cars = Car.near(params[:car][:address], 10)
    else
      @cars = Car.all
    end

    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
        infoWindow: render_to_string(partial: "info_window", locals: { car: car }),
        image_url: helpers.asset_url('https://lh3.googleusercontent.com/dtFuCbfBxODq263Ramrmu-7jXxjsdL2YdyXA243PtwLr2U5xOAaUi63FwSgDRKuNTXCyPEyghjW-D2EVlfjnp4HU')
      }
    end

    if params[:car][:address] != ""
      location = Geocoder.search(params[:car][:address])
      lat = location[0].latitude
      lng = location[0].longitude

      @marker = {
        lat: lat,
        lng: lng,
        image_url: helpers.asset_url('https://res.cloudinary.com/dcbecmbrj/image/upload/v1598008031/picto-home6_cldwio.png')
      }

      @markers << @marker
    end
  end

  def show
    @car = Car.find(params[:id])
    @booking = Booking.new
    @reviews = @car.reviews
    @average_rating = @reviews.average(:rating)
  end

  def new
    @car = Car.new
    @user = User.find(params[:user_id])
  end

  def create
    @car = Car.new(params_car)
    @car.user = User.find(params[:user_id])
    @car.save
    redirect_to car_path(@car)
  end

  def edit
    @car = Car.find(params[:id])
  end

  def update
    @car = Car.find(params[:id])
    @car.update(params_car)
    redirect_to car_path(@car)
  end

  def destroy
    @car = Car.find(params[:id])
    @car.destroy
    redirect_to cars_path
    # redirect_to dashboard
  end

  private

  def params_car
    params.require(:car).permit(:category, :brand, :model, :motorizing, :description, :start_date, :end_date, :user, :sell_price, :address, :daily_rent_price, photos: [])
  end
end
