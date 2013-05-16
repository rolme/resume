class SkillsetsController < ApplicationController

  def sort
    committed = false
    params[:skillset].each_with_index do |id, index|
      committed = Skillset.update_all({position: index+1}, id: id) == 1 ? true : false
    end
    render json: {
      updated: committed,
      payload: params
    }
  end
end