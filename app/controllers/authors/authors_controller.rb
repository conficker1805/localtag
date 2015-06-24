module Authors
	class AuthorsController < ApplicationController
		before_filter :authenticate_author!, only: [:dashboard]

		def dashboard
			render template: "authors/dashboard"
		end
	end
end
