class RecipesController < ApplicationController
  def index
    recipes = Recipe.all
    recipes_updated = []
    recipes.each do |recipe|
      recipe = {
        id: recipe.id,
        name: recipe.name,
        chef: recipe.chef_name,
        ingredients: recipe.ingredients_list,
        directions: recipe.directions_list,
        prep_time: recipe.friendly_prep_time
      }
      recipes_updated << recipe
    end
    render json: recipes_updated
  end

  def show
    recipe = Recipe.find_by(id: params[:id])

    render json: {
      id: recipe.id,
      name: recipe.name,
      chef: recipe.chef_name,
      ingredients: recipe.ingredients_list,
      directions: recipe.directions_list,
      prep_time: recipe.friendly_prep_time
    }
  end

  def create
    recipe = Recipe.create(
      name: params[:name],
      chef: params[:chef],
      ingredients: params[:ingredients],
      directions: params[:directions],
      prep_time: params[:prep_time]
    )

    render json: recipe
  end

  def update
    recipe = Recipe.find_by(id: params[:id])

    recipe.update(
      name: params[:name] || recipe.name,
      chef: params[:chef] || recipe.chef,
      ingredients: params[:ingredients] || recipe.ingredients,
      directions: params[:directions] || recipe.directions,
      prep_time: params[:prep_time] || recipe.prep_time
    )

    render json: recipe
  end

  def destroy
    recipe = Recipe.find_by(id: params[:id])

    recipe.destroy

    render json: { message: "Recipe deleted successfully!" }
  end
end
