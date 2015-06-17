class SubcribesController < ApplicationController
  def create
    @subcribe = Subcribe.new(create_params)
    if @subcribe.save
       flash[:notice] = 'Subcribe successfully'
    else
       flash[:alert] = 'Email address is incorrect or exist'
    end
    redirect_to root_path
  end

  private
  
  def create_params
    params.require(:subcribe).permit(:email)
  end
end
