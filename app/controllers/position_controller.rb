# encoding: utf-8

class PositionController < ApplicationController

  def calendar_view
  end

  def feeds
    start_date = Date.parse(params[:start])
    end_date = Date.parse(params[:end])
    user = User.first
    selected_positions = user.positions.where(:deadline => start_date..end_date)
    events = selected_positions.map { |position| {'id' => position.id, 
                                                  'title' => position.name + '-' + position.phase.description,
                                                  'allDay' => true,
                                                  'start' => position.deadline,
                                                  }  }
    render :json => events
  end

  def new
    @position = Position.new
    @position.phase_id = params[:phase_id]
    @phases = Phase.sorted
  end

  def create
    user = User.first
    @position = Position.new(allowed_params)

    
    if @position.save
      
      Phase.all.each do |phase|
        step = @position.steps.find_by_phase_id(phase.id) || Step.new
        step.steps = params["phase-#{phase.id}"].to_i
        step.phase_id = phase.id
        step.position_id = @position.id
        step.save
      end
      
      max_step = params["phase-#{params[:position][:phase_id]}"].to_i

      if @position.current_step > max_step
        @position.current_step = max_step 
        @position.save
      end

      @position.calculate_progress

      user.positions << @position
      flash[:notice] = "职位创建成功"
      redirect_to(:action => 'index')
    else
        render 'new'
    end
  end

  def index
    user = User.first
    @phases = Phase.sorted
    @positions = user.positions
  end

  def show
    @position = Position.find(params[:id])
  end

  def edit
    @phases = Phase.sorted
    @position = Position.find(params[:id])
  end

  def update
    @position = Position.find(params[:id])

    
    if @position.update_attributes(allowed_params)
        Phase.all.each do |phase|
          step = @position.steps.find_by_phase_id(phase.id) || Step.new
          step.steps = params["phase-#{phase.id}"].to_i
          step.phase_id = phase.id
          step.position_id = @position.id
          step.save
        end

        max_step = params["phase-#{params[:position][:phase_id]}"].to_i
        if @position.current_step > max_step
          @position.current_step = max_step 
          @position.save
        end

        @position.calculate_progress

        flash[:notice] = "职位更新成功"
        redirect_to(:action => 'show', :id => params[:id])
    else
        render(:action => 'edit')
    end
  end

  def delete
    @position = Position.find(params[:id])
  end

  def destroy
    position = Position.find(params[:id])
    position.destroy
    flash[:notice] = "职位删除成功"
    redirect_to(:action => 'index')
  end

  private

    def allowed_params
      params.require(:position).permit([:name, :company, :description, :phase_id, :note, :deadline, :current_step, :step_description, :waiting])
    end
end
