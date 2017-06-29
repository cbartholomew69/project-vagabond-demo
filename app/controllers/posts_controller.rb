class PostsController < ApplicationController
  # before_action :authenticate_user!
  load_and_authorize_resource  only: [:edit, :update, :destroy]

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
    @post = @city.posts.new(user_id: current_user.id,
                        title: request.params["post"]["title"],
                        content: request.params["post"]["content"],
                        photo: request.params["post"]["photo"])
    @post.save

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
 end
