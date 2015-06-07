class EnquiriesController < ApplicationController
  def new
  	@enquiry = Enquiry.new
  end

  def create
    @enquiry = Enquiry.new(create_params)
    if @enquiry.save
      redirect_to root_path, notice: 'Thank for your feedback'
    else
      render :new
    end
  end

  private
  
  def create_params
    params.require(:enquiry).permit(:first_name, :last_name, :email, :title, :message)
  end
end
