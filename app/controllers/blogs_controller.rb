class BlogsController < ApplicationController
  def index
  end

  def show
  	@blog = Blog.find(blog_id)
  end

  protected

  def blog_id
    params.require(:id)
  end
end
