class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :permitting_parameters, if: :devise_controller?
  after_filter :store_action
  
  def store_action
    return unless request.get? 
    if (request.path != "/users/sign_in" &&
        request.path != "/users/sign_up" &&
        request.path != "/users/password/new" &&
        request.path != "/users/password/edit" &&
        request.path != "/users/confirmation" &&
        request.path != "/users/sign_out" &&
        !request.xhr?) # don't store ajax calls
      store_location_for(:user, request.fullpath)
    end
  end
  def after_sign_out_path_for(resource_or_scope)
    root_path
  end
  def permitting_parameters
    attributes=[:name, :birthday, :phonenumber, :gender, :country, :city, :is_tattooist, :nick_name, 
                :image, :image_cache, :remove_image, :hourlyprice, :career, :introduction, :belong, :prizes, :specialty]
    devise_parameter_sanitizer.permit(:sign_up, keys: attributes)
    devise_parameter_sanitizer.permit(:account_update, keys: attributes)
  end
  
end
