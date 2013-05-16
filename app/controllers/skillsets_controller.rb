class SkillsetsController < ApplicationController

  def sort
    success = false
    params[:skillset].each_with_index do |id, index|
      success = Skillset.update_all({position: index+1}, id: id) == 1 ? true : false
    end
    render json: {
      updated: success,
      payload: params
    }
  end
end