class CarsController < ApplicationController
  def index
    @cars = Car.all
  end

  def show
    @car = Car.find(params[:id])
  end

  # def new
  #   @car = Car.new
  # end

  # def create
  #   @car = Car.new(params_car)
  #   @care.save
  #   redirect_to car_path(@car)
  # end

  # def edit
  #   @car = Car.find(params[:id])
  # end

  # def update
  #   @car = Car.find(params[:id])
  #   @car.update(params_car)
  #   redirect_to car_path(@car)
  # end

  private

  def params_car
    params.require(:car).permit(:category, :brand, :model, :motorizing, :description, :start_date, :end_time, :user, photos: [])
  end
end
