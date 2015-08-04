module PositionHelper

  def find_default(position, id)
    step = position.steps.find_by_phase_id(id)
    step ? step.steps : 1  
  end
end
