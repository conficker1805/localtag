module Authors
	class DashboardsController < ApplicationController
	  before_filter :authenticate_author!

		def my_blog
			@blogs = current_author.blogs
		end

    def my_profile

    end

    def new_blog
      @blog  = Blog.new
    end
	end
end
