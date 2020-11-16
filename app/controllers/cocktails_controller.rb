class CocktailsController < ApplicationController
  def index
    @cocktails = Cocktail.all
  end

  def show
    @dose = Dose.new #Sert pour initialiser le formulaire 'Dose'
    @cocktail = Cocktail.find(params[:id])
    @dose.cocktail = @cocktail
    #@ingredient = Ingredient.new
    #Pas besoin de créer une nouvelle instance @ingredient
    #car la table ingredient est déjà peuplée de 3 élements via le seed
    #Et on a paramétré d.association dans cocktails/show.html.erb pour contraindre l'utilisateur à 3 choix
    #Par contre la table dose est vide, donc besoin de créer une instance dose
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    raise
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      redirect_to root_path
    else
      render :new
    end
  end

  def destroy
    @cocktail = Cocktail.find(params[:id])
    @cocktail.destroy
    redirect_to root_path
  end

  private
  def cocktail_params
    params.require(:cocktail).permit(:name, :photo)
  end
end
