class Call < ApplicationRecord
  belongs_to :elevator
  validates_presence_of :elevator_id, :call_type, :floor_num
  validates_inclusion_of :call_type, in: %w( up down )
  validate :can_request_floor

  def can_request_floor
    elevator = Elevator.find_by(id: self.elevator_id)
    request = available_stops(elevator).sample

    # delete if no floor is available, otherwise add requested floor number
    if request.nil?
      errors.add(:requested_floor, "will be empty.")
    else
      self.floor_request = request
      puts "----------------------------------------------------------------------"
      puts "A new People called at floor n°#{self.floor_num} to go #{self.call_type} at floor n°#{self.floor_request}"
      puts "----------------------------------------------------------------------"
    end
    # launch elevator
    elevator.programm
  end

  private

  # get all available stops
  def available_stops(elevator)
    self.call_type == 'up' ? elevator.stops.select { |s| s > self.floor_num } : elevator.stops.select { |s| s < self.floor_num }
  end
end
