class Category < ActiveRecord::Base
	has_many :blogs

  validates :title, presence: true
end