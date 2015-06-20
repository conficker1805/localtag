class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new]

  def index
    @blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

  def create
    @blog = current_user.blogs.new(create_params)
    
    if @blog.save
      redirect_to root_path, notice: 'Create blog successfully'
    else
      render :new
    end
  end

  def show
  	@blog    = Blog.find(blog_id)
    @relateds = Blog.where(category: @blog.category).limit(2)
  end

  protected

  def blog_id
    params.require(:id)
  end

  def create_params
  	params.require(:blog).permit(:title, :intro, :content, :category_id)
  end
end
