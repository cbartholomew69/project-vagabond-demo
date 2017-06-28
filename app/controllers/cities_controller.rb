class CitiesController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  def show
    @city = City.find(params[:id])
    @posts = @city.posts.order("created_at DESC")
    puts @posts
  end

end
