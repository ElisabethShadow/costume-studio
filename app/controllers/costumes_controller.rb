class CostumesController < ApplicationController

  def index
    if params["category"]
      category = params[:catergory]
      @costumes = Costume.where(category: category)
      raise
    else
      @costumes = Costume.all
    end
    # raise
  end

end
