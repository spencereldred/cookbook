class IngredientRecipesController < ApplicationController
  # allows access to the ingredients/index and ingredients/show
  before_filter :authorize, except: [:index, :show]

  def index
    flash[:errors] = []
    @ingredient_recipes = IngredientRecipe.all
  end

  def new
    flash[:errors] = []
    @ingredient_recipe = IngredientRecipe.new
  end

  def create
    ingredient_recipe = IngredientRecipe.create(params[:ingredient_recipe])
    if ingredient_recipe.errors.empty?
      redirect_to ingredient_recipe_path(ingredient_recipe)
    else
      flash[:errors] = ingredient_recipe.errors.full_messages
      @ingredient_recipe = IngredientRecipe.new
      render :new
    end
  end

  def edit
    flash[:errors] = []
    @ingredient_recipe = IngredientRecipe.find(params[:id])
    #puts "$$$$$$$$$$$$ @ingredient_recipe = #{@ingredient_recipe.title}"
    # edit.html.erb
  end

  def update
    ingredient_recipe = IngredientRecipe.find(params[:id])
    ingredient_recipe.update_attributes(params[:ingredient_recipe])
    redirect_to ingredient_recipe_path(ingredient_recipe)
  end

  def show
    @ingredient_recipe = IngredientRecipe.find(params[:id])
  end

  def destroy
    IngredientRecipe.delete(params[:id])
    redirect_to ingredient_recipes_path
  end
end
