module Authors
	class DashboardsController < ApplicationController
	  before_filter :authenticate_author!

		def my_blog
			@blogs = current_author.blogs
		end
	end
end