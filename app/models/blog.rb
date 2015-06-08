class Blog < ActiveRecord::Base
	belongs_to :category

  validates :title, presence: true
  validates :content, presence: true
  validates :category_id, presence: true
end