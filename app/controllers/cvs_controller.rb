class CvsController < ApplicationController

  def show
    @user = User.find(1, :include => :contact_informations)
    @cv = Cv.find(params[:id], :include => :sections)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
