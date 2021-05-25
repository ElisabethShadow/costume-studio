class CostumesController < ApplicationController

  def index
    additional_vars_for_index_view

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
    redirect_to costumes_path
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :description, :size, :price, :category)
  end

  def additional_vars_for_index_view
    @categories = Costume.categories
    @number_of_costumes = @categories.map { |cat| Costume.where(category: cat).length }
    @total_number_of_costumes = 0
    @number_of_costumes.each { |n| @total_number_of_costumes += n }
  end
end
