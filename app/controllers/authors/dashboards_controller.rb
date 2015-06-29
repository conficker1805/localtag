module Authors
	class DashboardsController < ApplicationController
	  before_filter :authenticate_author!

		def my_blog
			@blogs = current_author.blogs
		end

    def my_profile; end

    def new_blog
      @blog  = Blog.new
    end

    def edit_blog
      @blog = Blog.find(blog_id)
      render :new_blog
    end

    protected

    def blog_id
      params.require(:blog_id)
    end
	end
end
