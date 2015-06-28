class BlogsController < ApplicationController
  before_filter :authenticate_author!, only: [:new]

  def index
    @search = Blog.search(params[:keyword])
    @blogs = @search.result.paginate(:page => params[:page], :per_page => 6)
  end

  def new
  	@blog = Blog.new
  end

  def create
    @blog = current_author.blogs.new(blog_params)
    if @blog.save
      redirect_to author_blogs_dashboard_path, notice: 'Create blog successfully'
    else
      render :new
    end
  end

  def edit
    @blog = Blog.find(blog_id)
    render 'authors/dashboards/new_blog'
  end

  def update
    @blog = Blog.find(blog_id)

    if @blog.update(blog_params)
      redirect_to author_edit_blogs_dashboard_path(@blog), notice: 'Update blog successfully'
    else
      redirect_to author_edit_blogs_dashboard_path(@blog)
    end
  end

  def show
  	@blog     = Blog.find(blog_id)
    @relateds = Blog.where(category: @blog.category).order("RANDOM()").limit(1)
  end

  def delete_selected_blogs
    if blog_ids.nil?
      flash[:alert] = 'Please select blogs'
    else
      Blog.where(id: blog_ids).destroy_all
      flash[:notice] = 'Deleted blogs successfully.'
    end
    redirect_to author_blogs_dashboard_path
  end

  protected

  def blog_id
    params.require(:id)
  end

  def blog_ids
    params.permit(ids:[])[:ids]
  end

  def blog_params
  	params.require(:blog).permit(:title, :intro, :content, :published, :category_id)
  end
end
