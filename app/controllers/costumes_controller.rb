class CostumesController < ApplicationController
  def new
    @costume = Costume.new
  end
  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user
    if @costume.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :size, :price, :category)
  end
end
