class Step < ActiveRecord::Base
    belongs_to :position
    belongs_to :phase
end
