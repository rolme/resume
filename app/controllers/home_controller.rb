class HomeController < ApplicationController
  def index
    @user = User.find_by_id params[:id], :include => :contact_information
    @cv   = Cv.find_by_id params[:cv_id], :include => :sections


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
