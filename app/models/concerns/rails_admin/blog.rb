module RailsAdmin::Blog
  extend ActiveSupport::Concern

  included do
    rails_admin do
      edit do
        field :title
        field :cover_photo
        field :category
        field :author
        field :status
        field :published
        field :intro
        field :content, :ck_editor
      end
    end
  end
end

