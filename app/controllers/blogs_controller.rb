class BlogsController < ApplicationController
  def index
    @blogs = Blog.all
  end

  def new
  	@blog = Blog.new
  end

  def create
  	@blog = Blog.new(create_params)
    if @blog.save
      redirect_to root_path, notice: 'Create blog successfully'
    else
      render :new
    end
  end

  def show
  	@blog = Blog.find(blog_id)
  end

  protected

  def blog_id
    params.require(:id)
  end

  def create_params
  	params.require(:blog).permit(:title, :intro, :content, :category_id)
  end
end
