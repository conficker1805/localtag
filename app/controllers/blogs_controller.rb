class BlogsController < ApplicationController
  before_filter :authenticate_author!, except: [:show, :index]

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
      flash[:notice] = 'Create blog successfully'
      render status: :ok, json: { :redirect => author_blogs_dashboard_path }
    else
      render status: 404, json: { :message =>  @blog.errors.full_messages.first }
    end
  end

  def edit
    @blog = Blog.find(blog_id)
    render 'authors/dashboards/new_blog'
  end

  def update
    @blog = Blog.find(blog_id)

    if @blog.update(blog_params)
      render status: :ok, json: { :message => 'Update blog successfully' }
    else
      render status: 404, json: { :message =>  @blog.errors.full_messages.first }
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

  def change_state
    @blog = current_author.blogs.find_by(id: blog_id)

    if @blog
      @blog.update(published: !@blog.published)
      render status: :ok, json: { :message => 'Update blog successfully' }
    else
      flash[:alert] = "You don't have permission to update this blog"
      render status: :ok, json: { :redirect => root_path }
    end
  end

  protected

  def blog_id
    params.require(:id)
  end

  def current_state
    params.require(:state)
  end

  def blog_ids
    params.permit(ids:[])[:ids]
  end

  def blog_params
  	params.require(:blog).permit(:title, :intro, :content, :published, :category_id, :cover_photo)
  end
end
