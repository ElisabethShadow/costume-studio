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

   def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy

    # no need for app/views/restaurants/destroy.html.erb

    redirect_to costumes_path
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :size, :price, :category)
  end

  end
