class PostsController < ApplicationController

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
    puts "request.body is: "
    puts request.body
    @post = Post.create(city_id: request.params["city_id"], title: request.params["post"]["title"], content: request.params["post"]["content"], photo: request.params["post"]["photo"])
    redirect_to "/cities/#{@post.city_id}/posts/#{@post.id}"
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
  @post = Post.find(params[:id])
  @post.update(title: params[:title], content: params[:content])
  redirect_to "/cities/#{@post.city_id}/posts/#{@post.id}"
end

  def destroy
    @post = Post.find(params[:id])
    @city = @post.city
    @post.delete
    redirect_to city_path(@city)
  end
 end
