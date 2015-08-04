class Position < ActiveRecord::Base

    scope :sorted, lambda { order(' progress DESC')}

    belongs_to :user
    belongs_to :phase
    has_many :steps

    before_destroy lambda { self.steps.destroy_all}

    
    def calculate_progress

        finished = Step.joins(:phase).where(:position_id => self.id).where("stage < ?", self.phase.stage).sum(:steps) + self.current_step - 1
        total = Step.joins(:phase).where(:position_id => self.id).sum(:steps)

        if self.waiting
            finished += 1
        end
        
        if total == 0
            self.progress = 0.0
        else
            self.progress = 1.0 * finished / total || 0
        end
        self.save
    end

end
