class UsersController < ApplicationController
    before_action :authenticate_user!, :except => [:show]

    def show
      @user = User.find(params[:id])
      @posts = @user.posts.order("created_at DESC")
      @cities_contributed_to = @posts.map do |post|
        post.city
      end
      @cities_contributed_to.uniq!
      @contributions = @cities_contributed_to.count
    end
end
