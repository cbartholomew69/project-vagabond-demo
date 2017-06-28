class CitiesController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @cities = City.new
  end

  def show
    @city = City.friendly.find(params[:id])
    @posts = @city.posts.order("created_at DESC")
    puts @posts
  end

end
