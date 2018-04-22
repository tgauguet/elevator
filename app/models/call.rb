class Call < ApplicationRecord
  belongs_to :elevator
  validates_presence_of :elevator_id, :direction, :floor_request, on: :create
  validates_inclusion_of :direction, in: %w( up down )
  validate :can_request_floor, on: :create
  scope :uncomplete, -> { where(completed: false) }
  scope :inside, -> { where(inside: true) }
  scope :outside, -> { where(inside: false) }

  def can_request_floor
    errors.add(:requested_floor, "will be empty.") if available_stops(self.elevator).sample.nil?
  end

  private

  # get all available stops
  def available_stops(elevator)
    self.direction == 'up' ? elevator.stops.select { |s| s > self.floor_request } : elevator.stops.select { |s| s < self.floor_request }
  end

end
