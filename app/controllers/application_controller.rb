class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def finished_steps(position)
    Step.joins(:phase).where(:position_id => position.id).where("stage < ?", position.phase.stage).sum(:steps) + position.current_step - 1
  end

  def all_steps(position)
    Step.joins(:phase).where(:position_id => position.id).sum(:steps)
  end

end
