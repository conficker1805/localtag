module Authors
	class SessionsController < Devise::SessionsController
	end

	protected

	def after_sign_in_path_for(resource)
	  author_dashboard_path('my-blog')
	end
end
