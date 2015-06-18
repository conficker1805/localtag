class Blog < ActiveRecord::Base
	include RailsAdmin::Blog
	belongs_to :category

  validates :title, :content, :category_id, presence: true
end