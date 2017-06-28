class PostsController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  # def index
  #   @posts = Post.all
  # end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @city = City.find(params[:city_id])
    @post = @city.posts.new
  end

  def create
    #need to fix this with strong params
    @post = Post.create(city_id: request.params["city_id"],
                        user_id: current_user.id,
                        title: request.params["post"]["title"],
                        content: request.params["post"]["content"],
                        photo: request.params["post"]["photo"])

    redirect_to "/cities/#{@post.city_id}/posts/#{@post.id}"
  end

  def edit
    @post = Post.find(params[:id])
    @city = @post.city
  end

  def update
    #need to use the params method here too
    @city = City.find(params[:city_id])
    @post = Post.find(params[:id])
    @post.update(title: params["post"]["title"],
                 content: params["post"]["content"],
                 photo: params["post"]["photo"])
    redirect_to "/cities/#{@post.city_id}/posts/#{@post.id}"
  end

  def destroy
    @post = Post.find(params[:id])
    @city = @post.city
    @post.delete
    redirect_to city_path(@city)
  end
 end