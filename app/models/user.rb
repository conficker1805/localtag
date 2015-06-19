class User < ActiveRecord::Base
  include RailsAdmin::User
  extend Enumerize

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :blogs

  enumerize :role, in: [:author, :manager], default: :author

  has_attached_file :avatar, :styles => { :medium => "300x300#", :thumb => "190x190#" } 
  																#:default_url => "/images/:style/missing.png"
  validates_attachment_size :avatar, :in => 0.megabytes..2.megabytes, message: 'The photo must be less than 2Mb'
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
end
