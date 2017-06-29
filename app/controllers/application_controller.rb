class ApplicationController < ActionController::Base
  protect_from_forgery

  include CanCan::ControllerAdditions

  rescue_from CanCan::AccessDenied do |exception|
    flash[:notice] = "Sorry, you cannot modify another user's content."
    flash.keep(:notice)
    redirect_to root_url
  end


  def home
    render 'cities/home'
  end


end
