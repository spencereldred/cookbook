class RecipesController < ApplicationController
  # allows access to the recipes/index and recipes/show
  before_filter :authorize, except: [:index, :show]

  def index
    flash[:errors] = []
    @recipes = Recipe.all
  end

  def new
    flash[:errors] = []
    @recipe = Recipe.new
  end

  def create
    recipe = Recipe.create(params[:recipe])
    if recipe.errors.empty?
      redirect_to recipe_path(recipe)
    else
      flash[:errors] = recipe.errors.full_messages
      @recipe = Recipe.new
      render :new
    end

  end

  def edit
    flash[:errors] = []
    @recipe = Recipe.find(params[:id])
  end

   def show
    @recipe = Recipe.find(params[:id])
    @ingredients = Ingredient.all
    @ingredients_for_recipe = IngredientRecipe.where("recipe_id = ? ", params[:id])
  end

  def update
    recipe = Recipe.find(params[:id])
    recipe.update_attributes(params[:recipe])
    redirect_to recipe_path(recipe)
  end

  def destroy
    Recipe.delete(params[:id])
    redirect_to recipes_path
  end

end
