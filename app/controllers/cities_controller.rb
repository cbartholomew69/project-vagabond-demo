class CitiesController < ApplicationController
  before_action :authenticate_user!, :except => [:show, :index]
  load_and_authorize_resource  only: [:edit, :update, :destroy]

 def index
    @cities = City.all
  end

 def new
    @city = City.new
  end

 def create
    #need to fix this with strong params
    @city = City.new(name: request.params["city"]["name"],
                        photo: request.params["city"]["photo"])
    @city.save

   respond_to do |format|
      if @city.save
        format.html { redirect_to "/cities/#{@city.slug}", notice: "#{@city.name} was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

 def edit
    @city = City.find(params[:id])
    puts @city
  end

 def update
    #need to use the params method here too
    @city = City.find(params[:id])
    @city.update(name: params["city"]["name"],
                 photo: params["city"]["photo"])
    redirect_to "/cities/#{@city.slug}"
  end

 def show
    @city = City.friendly.find(params[:id])
    @posts = @city.posts.order("created_at DESC")
  end

  def destroy
    @city = City.find(params[:id])
    @city.delete
  if @city.delete
     redirect_to cities_path,
                notice: 'City successfully destroyed.'
  else
    redirect_to cities_path,
                alert: 'Error destroying city.'
  end
 end
end
