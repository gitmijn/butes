class StepsController < ApplicationController
  def index
    @steps = Step.all
  end

  def show
    @step = Step.find(params[:id])
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(params[:step])
    if @step.save
      redirect_to @step, :notice => "Successfully created step."
    else
      render :action => 'new'
    end
  end

  def edit
    @step = Step.find(params[:id])
  end

  def update
    @step = Step.find(params[:id])
    if @step.update_attributes(params[:step])
      redirect_to @step, :notice  => "Successfully updated step."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @step = Step.find(params[:id])
    @step.destroy
    redirect_to steps_url, :notice => "Successfully destroyed step."
  end
end
