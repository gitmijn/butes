class RecipesController < ApplicationController
  def index
    @recipes = Recipe.all
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(params[:recipe])
    if @recipe.save
      redirect_to @recipe, :notice => "Successfully created recipe."
    else
      render :action => 'new'
    end
  end

  def edit
    @recipe = Recipe.find(params[:id])
  end

  def update
    @recipe = Recipe.find(params[:id])
    if @recipe.update_attributes(params[:recipe])
      redirect_to @recipe, :notice  => "Successfully updated recipe."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_url, :notice => "Successfully destroyed recipe."
  end
end
