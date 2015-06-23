class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def index
  	@blogs = Blog.all.order('created_at ASC').limit(4)
  end
end
