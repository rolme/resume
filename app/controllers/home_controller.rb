class HomeController < ApplicationController
  def index
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @user }
    end
  end
end
