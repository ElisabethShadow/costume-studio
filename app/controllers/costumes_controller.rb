class CostumesController < ApplicationController

  def index
    if params["category"]
      @category = params[:category]
      @costumes = Costume.where(category: @category)
      # raise
    else
      @category = nil
      @costumes = Costume.all
    end
  end

end
