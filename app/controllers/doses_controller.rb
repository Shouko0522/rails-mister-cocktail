class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    # First, we check for the ingredient name:
    ingredient_name = ingredient_params[:ingredient_name]
    @ingredient = Ingredient.find_by(name: ingredient_name)
    if !@ingredient
      @ingredient = Ingredient.new(name: ingredient_name)
      @ingredient.save
    end
    @dose = Dose.new(dose_params)
    # After we make the dose, continue as normal
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    @dose.ingredient = @ingredient

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.delete
  end

  private

  def dose_params
    params.require(:dose).permit(:description)
  end

  def ingredient_params
    params.permit(:ingredient_name)
  end
end
