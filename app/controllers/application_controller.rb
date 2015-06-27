class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  def index
  	@blogs = Blog.all.order('created_at ASC').limit(4)
  end

  protected

  def configure_permitted_parameters
    if resource_name == :author
      devise_parameter_sanitizer.for(:account_update) << [
                                                          :name,
                                                          :avatar,
                                                          :description
                                                        ]
    end
  end
end
