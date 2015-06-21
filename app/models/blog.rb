class Blog < ActiveRecord::Base
	include RailsAdmin::Blog

	belongs_to :category
	belongs_to :user

  validates :title, :content, :category_id, presence: true
  has_attached_file :cover_photo, :styles => { :medium => "300x300#", :thumb => "190x190#" } 
  																#:default_url => "/images/:style/missing.png"
  validates_attachment_size :cover_photo, :in => 0.megabytes..2.megabytes, message: 'The photo must be less than 2Mb'
  validates_attachment_content_type :cover_photo, :content_type => /\Aimage\/.*\Z/

  def current_method
  	self.new_record? ? 'Create' : 'Update'
  end
end