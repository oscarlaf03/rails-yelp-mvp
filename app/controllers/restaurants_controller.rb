class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit,:destroy, :update]
  def index
    @restaurants = Restaurant.all
  end

  def show
    @reviews = @restaurant.reviews.order(created_at: :desc)
    @review = Review.new #Para funcione o form do review dentro do show do restaurant
    @total_reviews = @reviews.count
    @rating_average = @reviews.average(:rating)
  end

  def new
    @restaurant = Restaurant.new
  end

  def create
    @restaurant = Restaurant.new(check_params_restaurant)
    if @restaurant.save
      redirect_to restaurants_path
    else
      render :new
    end
  end

  def edit
  end

  def update
    @restaurant.update(check_params_restaurant)
    if @restaurant.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_path
  end

  private

  def set_restaurant
    @restaurant = Restaurant.find(params[:id])
  end

  def check_params_restaurant
    params.require(:restaurant).permit(:category,:name,:phone_number ,:address)
  end
end
