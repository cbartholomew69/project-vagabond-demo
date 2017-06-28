class ApplicationController < ActionController::Base
  protect_from_forgery

  def home
    render 'cities/home'
  end


end
