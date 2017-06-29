class CitiesController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def index
    @cities = City.all
  end

  def new
    @city = City.new
  end

  def show
    @city = City.friendly.find(params[:id])
    @posts = @city.posts.order("created_at DESC")
    puts @posts
  end
   def create
    @city = City.new(params[:id])
    if @city.save

      flash[:success] = "Welcome to the Sample App!"
      redirect_to @city
    else
      render 'new'
    end
  end
end
  def destroy
    @city = City.find(params[:id])

  if city.destroy
     redirect_to post_path(@comment.post_id),
                notice: 'City post successfully destroyed.'
  else
    redirect_to post_path(@city.post_id),
                alert: 'Error destroying comment.'
  end
end

