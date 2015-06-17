module RailsAdmin::Admin
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :email
        field :password
        field :permission
      end
    end
  end
end