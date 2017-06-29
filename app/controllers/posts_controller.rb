class PostsController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource  only: [:edit, :update, :destroy]

  before_action :default_post_img, :only => [:create, :update]
  def index
    @city = City.friendly.find(params[:city_id])
    redirect_to city_path(@city)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @city = City.friendly.find(params[:city_id])
    @post = @city.posts.new
  end

  def create
    #need to fix this with strong params
    @city = City.friendly.find(params[:city_id])
    # @post = @city.posts.new(user_id: current_user.id,
    #                     title: request.params["post"]["title"],
    #                     content: request.params["post"]["content"],
    #                     photo: request.params["post"]["photo"])
    # @post.save
    @post = Post.new(new_post_params)
    # @post.save
    # sdjklsadfljkfsdjlkfsdlj

    respond_to do |format|
      if @post.save
        format.html { redirect_to "/cities/#{@city.slug}/posts/#{@post.id}", notice: "Your post about #{@city.name} was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
    @city = @post.city
  end

  def update
    #need to use the params method here too
    @city = City.friendly.find(params[:city_id])
    @post = Post.find(params[:id])
    @post.update(title: params["post"]["title"],
                 content: params["post"]["content"],
                 photo: params["post"]["photo"])
    redirect_to "/cities/#{@post.city.slug}/posts/#{@post.id}"
  end

  def destroy
    puts "delete now"
    @post = Post.find(params[:id])
    @city = @post.city
    @post.delete
    redirect_to city_path(@city)
  end

  private
  def new_post_params
    params.require(:post)
          .permit(:title, :content, :photo)
          .merge(:user_id => current_user.id, :city_id => City.friendly.find(params[:city_id]).id)
  end

  def default_post_img
    if params[:post][:photo] == ''
      params[:post][:photo] = 'https://www.tcmworld.org/wp-content/uploads/2015/12/fork-in-the-road-1.jpg'
    end
  end

 end
