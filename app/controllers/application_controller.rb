class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def home
    render 'cities/home'
  end


end
