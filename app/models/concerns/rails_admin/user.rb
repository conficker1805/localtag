module RailsAdmin::User
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :name
        field :avatar
        field :role
        field :email
        field :password
        field :description
      end
    end
  end
end

