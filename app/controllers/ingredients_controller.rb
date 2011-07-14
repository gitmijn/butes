class IngredientsController < ApplicationController
  def index
    @ingredients = Ingredient.all
  end

  def show
    @ingredient = Ingredient.find(params[:id])
  end

  def new
    @ingredient = Ingredient.new
  end

  def create
    @ingredient = Ingredient.new(params[:ingredient])
    if @ingredient.save
      redirect_to @ingredient, :notice => "Successfully created ingredient."
    else
      render :action => 'new'
    end
  end

  def edit
    @ingredient = Ingredient.find(params[:id])
  end

  def update
    @ingredient = Ingredient.find(params[:id])
    if @ingredient.update_attributes(params[:ingredient])
      redirect_to @ingredient, :notice  => "Successfully updated ingredient."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @ingredient = Ingredient.find(params[:id])
    @ingredient.destroy
    redirect_to ingredients_url, :notice => "Successfully destroyed ingredient."
  end
end
