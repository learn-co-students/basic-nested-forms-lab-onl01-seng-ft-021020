class RecipesController < ApplicationController
  def show
    @recipe = Recipe.find(params[:id])
  end

  def index
    @recipes = Recipe.all
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build(name: "this seems wrong") 
    @recipe.ingredients.build(name: "there must be a better way")
  end

  def create
    @recipe = Recipe.create(recipe_params)
  end

  def recipe_params
    params.require(:recipe).permit(:title, ingredients_attributes: [:name, :quantity])
  end
end
