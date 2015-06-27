module Authors
  class RegistrationsController < Devise::RegistrationsController
    protected

    def update_resource(resource, params)
      #resource.update_with_password(params)
      resource.update_without_password(params)
    end

    def after_update_path_for(resource)
      author_profile_dashboard_path
    end
  end
end
