class Blog < ActiveRecord::Base
	include RailsAdmin::Blog
	belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
end