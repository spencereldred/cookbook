class IngredientsController < ApplicationController
  # allows access to the ingredients/index and ingredients/show
  before_filter :authorize, except: [:index, :show]

  def index
    flash[:errors] = []
    @ingredients = Ingredient.all
  end

  def new
    flash[:errors] = []
    @ingredient = Ingredient.new
  end

  def create
    ingredient = Ingredient.create(params[:ingredient])
    if ingredient.errors.empty?
      redirect_to ingredient_path(ingredient)
    else
      flash[:errors] = ingredient.errors.full_messages
      @ingredient = Ingredient.new
      render :new
    end

  end

  def edit
    flash[:errors] = []
    @ingredient = Ingredient.find(params[:id])
  end

   def show
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    ingredient = Ingredient.find(params[:id])
    ingredient.update_attributes(params[:ingredient])
    redirect_to ingredient_path(ingredient)
  end

  def destroy
    Ingredient.delete(params[:id])
    redirect_to ingredients_path
  end


end
