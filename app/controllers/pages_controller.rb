class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :index, :show]

  def home
    @cars = Car.all
  end

  def index
  end

  def show
  end

end
