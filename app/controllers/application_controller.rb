class ApplicationController < ActionController::Base
  protect_from_forgery

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Access denied!"
    flash.keep(:notice)
    redirect_to root_url
  end

  def home
    render 'cities/home'
  end


end
