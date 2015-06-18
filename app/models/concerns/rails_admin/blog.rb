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
      end
    end
  end
end

