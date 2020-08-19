class CarsController < ApplicationController
  def index
    @cars = Car.geocoded
    if params[:car][:category].present?
      @cars = @cars.select { |car| car.category.start_with?(params[:car][:category])}
    elsif params[:car][:model].present?
      @cars = @cars.select { |car| car.category.start_with?(params[:car][:model])}
    else
      @cars = Car.all
    end
    @markers = @cars.map do |car|
      {
        lat: car.latitude,
        lng: car.longitude,
      }
    end
  end

  def show
    @car = Car.find(params[:id])
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
    params.require(:car).permit(:category, :brand, :model, :motorizing, :description, :start_date, :end_time, :user, photos: [])
  end
end
