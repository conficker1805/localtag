class Admin < ActiveRecord::Base
	include RailsAdmin::Admin
	extend Enumerize
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :trackable, :validatable

  enumerize :permission, in: [:author, :admin], default: :author
end
