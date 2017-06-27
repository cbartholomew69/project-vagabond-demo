class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @posts = @city.posts
    puts @posts
  end

end
