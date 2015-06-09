class EnquiryMailer < ActionMailer::Base
  def thank_for_feedback(enquiry)
    @enquiry = enquiry
    mail(
        from: Rails.application.secrets.admin_email,
        to:   @enquiry.email,
        subject: "[Local Tag] - Thank for your feedback!"
    )
  end

  def send_feedback_to_admin(enquiry)
    @enquiry = enquiry
    mail(
        from: @enquiry.email,
        to:   Rails.application.secrets.admin_email,
        subject: "[Local Tag] - Feedback email"
    )
  end
end
