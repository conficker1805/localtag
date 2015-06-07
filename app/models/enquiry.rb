class Enquiry < ActiveRecord::Base
	after_create :thank_for_feedback
  after_create :send_feedback_to_admin

  validates :first_name, 	presence: true
  validates :last_name, 	presence: true
  validates :email, 			presence: true
  validates :title, 			presence: true
  validates :message, 		presence: true

  protected

  def thank_for_feedback
    EnquiryMailer.thank_for_feedback(self).deliver_now
  end

  def send_feedback_to_admin
  	EnquiryMailer.send_feedback_to_admin(self).deliver_now
  end
end