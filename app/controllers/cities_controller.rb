class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @posts = @city.posts.order("created_at DESC")
    puts @posts
  end

end
