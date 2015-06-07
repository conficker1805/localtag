class EnquiriesController < ApplicationController
  def new
  	@enquiry = Enquiry.new
  end
end
