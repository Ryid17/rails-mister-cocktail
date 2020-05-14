class DosesController < ApplicationController
  before_action :set_dose, only: [:new, :create, :destroy]

  def new
    @dose = Dose.new
  end

  def create
    @dose.cocktail = @dose
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose.delete
  end

  private

  def set_dose
    @dose = dose.find(params[:ingredient_id])
  end

  def doses_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
