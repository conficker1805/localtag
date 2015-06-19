module RailsAdmin::Blog
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :title
        field :cover_photo
        field :intro
        field :content, :ck_editor
        field :category
        field :user
      end
    end
  end
end

