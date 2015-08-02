class Position < ActiveRecord::Base
    belongs_to :user
    belongs_to :phase
end
