# encoding: utf-8

class PhaseEditController < ApplicationController
  def index
    @phases = Phase.sorted
  end

  def show
    @phase = Phase.find(params[:id])
  end

  def new
    @phase = Phase.new
  end

  def create
      @phase = Phase.new(allowed_params)
      if @phase.save
        redirect_to(:action => 'index')
    else
        render 'new'
    end
  end

  def edit
    @phase = Phase.find(params[:id])
  end

  def update
    @phase = Phase.find(params[:id])
    if @phase.update_attributes(allowed_params)
        redirect_to(:action => 'show', :id => params[:id])
    else
        render(:action => 'edit')
    end
  end

  def delete
    @phase = Phase.find(params[:id])
  end

  def destroy
    phase = Phase.find(params[:id])
    phase.destroy
    redirect_to(:action => 'index')
  end

  private

    def allowed_params
        params.require(:phase).permit([:description, :stage])
    end

end
