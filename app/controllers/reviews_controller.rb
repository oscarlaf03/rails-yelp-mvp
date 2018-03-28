class ReviewsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :new, :create, :destroy]

  def index
    @reviews = Review.all
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(check_params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  def edit
  end

  def destroy
    @review.destroy
  end

  private

  def check_params_review
    params.require(:review).permit(:content,:rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_restaurant
    @restaurant = Restaurant.find(params[:restaurant_id])
  end



end
