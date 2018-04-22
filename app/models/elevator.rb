class Elevator < ApplicationRecord
  has_many :calls
  validates_presence_of :name, :floor
  after_initialize :set_default
  attr_accessor :stops

  def set_default
    self.stops = (0...(self.floor + 1)).to_a
    programm
  end

  def programm
    set_next_destination
    update_elevator_position
    let_people_go_inside_and_set_their_destination
    let_people_go_outside
  end

  def people_inside
    self.calls.inside.count
  end

  private

  def set_next_destination
    calls = self.calls.uncomplete

    if calls.present?
      call = next_call_in_current_direction
      if call.nil?
        self.direction = self.direction == 'up' ? 'down' : 'up'
      end
      call = next_call_in_current_direction
    else
      self.destination = 0 if self.position != 0
      self.direction = self.position != 0 ? "down" : "up"
    end
    self.destination = call.floor_request if call
  end

  def update_elevator_position
    pos = self.position

    if self.stops.include?(pos) && pos != self.destination
      if self.direction == "up"
        pos += 1 unless pos == self.floor
      elsif self.direction == "down"
        pos -= 1 unless pos == 0
      end
    end
    self.update(position: pos) unless pos == self.position
  end

  def next_call_in_current_direction
    calls = self.calls.uncomplete

    if self.direction == "up"
      call = calls.where("floor_request > ?", self.position)
                  .order("floor_request ASC").first
    elsif self.direction == "down"
      call = calls.where("floor_request < ?", self.position)
                  .order("floor_request DESC").first
    end
  end

  def available_stops
    self.direction == 'up' ? self.stops.select { |s| s > self.position } : self.stops.select { |s| s < self.position }
  end

  def let_people_go_inside_and_set_their_destination
    stops = available_stops
    calls = self.calls.direction_match(self.direction)
                      .arrived(self.position)
                      .outside
                      .uncomplete

    calls.each do |c|
      c.update(inside: true, floor_request: stops.sample)
    end
  end

  def let_people_go_outside
    calls = self.calls.inside
                      .arrived(self.position)

    calls.each do |c|
      c.update(inside: false, completed: true)
    end
  end

end
