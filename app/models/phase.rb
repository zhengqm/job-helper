class Phase < ActiveRecord::Base

    has_many :steps
    has_many :positions

    validates :stage,  numericality: { only_integer: true }

    scope :sorted, lambda { order(' stage ASC')}
end
