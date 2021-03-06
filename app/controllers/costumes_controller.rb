class CostumesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def show
    @costume = Costume.find(params[:id])
    @booking = Booking.new
  end

  def index
    additional_vars_for_index_view

    if params[:query].present?
      @costumes = Costume.search_by_name_category_and_description(params[:query])
    else
      if params["category"]
        @category = params[:category]
        @costumes = Costume.where(category: @category)
      else
        @category = nil
        @costumes = Costume.all
      end
    end
  end

  def new
    @costume = Costume.new
  end

  def create
    @costume = Costume.new(costume_params)
    @costume.user = current_user

    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :new
    end
  end

  def destroy
    @costume = Costume.find(params[:id])
    @costume.destroy
    redirect_to user_path(option: costumes)
  end

  def edit
    @costume = Costume.find(params[:id])
  end

  def update
    # @costume = Costume.update(costume_params)
    @costume = Costume.find(params[:id])
    @costume.update(costume_params)

    if @costume.save
      redirect_to costume_path(@costume)
    else
      render :edit
    end
  end

  private

  def costume_params
    params.require(:costume).permit(:name, :photo, :description, :size, :price, :category)
  end

  def additional_vars_for_index_view
    @categories = Costume.categories
    @number_of_costumes = @categories.map { |cat| Costume.where(category: cat).length }
    @total_number_of_costumes = 0
    @number_of_costumes.each { |n| @total_number_of_costumes += n }
  end
end
