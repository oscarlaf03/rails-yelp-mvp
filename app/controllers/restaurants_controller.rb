class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit,:destroy]
  def index
    @restaurants = Restaurant.all
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(check_params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def check_params_restaurant
    params.require(:restaurant).permit(:category,:name,:phone_number ,:address)
  end
end
