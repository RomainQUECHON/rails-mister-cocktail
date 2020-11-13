class DosesController < ApplicationController
  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new(doses_params)
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render 'cocktails/show'
    end
  end

  def destroy
    @dose = Dose.find(params[:id])
    cocktail = @dose.cocktail
    @dose.delete
      # respond_to do |format|
      #   format.html { redirect_to cocktail_path(@cocktail), notice: 'The dose has been successfully deleted.' }
      #   format.json { head :no_content }
    #end
    redirect_to cocktail_path(cocktail)
  end

private
  def doses_params
    params.require(:dose).permit(:description, :ingredient_id, :cocktail_id)
  end
end
