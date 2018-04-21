class Elevator < ApplicationRecord
  has_many :calls
  validates_presence_of :name, :floor
  after_initialize :set_default
  attr_accessor :stops

  def set_default
    self.stops = (0...(self.floor + 1)).to_a
  end

  def programm
    res = get_next_destination
    puts_strings(res)
  end

  def next_floor
    people_inside
  end

  def people_inside
    new_peoples = self.calls #.where(floor_num: self.position).where(call_type: self.moove_type)
    new_peoples.count
  end

  private

  def get_next_destination
    self.position
  end

  # to be deleted
  def puts_strings(res)
    puts "----------------------------------------------------------------------"
    puts "Ascenseur est au 0 ()"
    puts "----------------------------------------------------------------------"
    puts "----------------------------------------------------------------------"
    puts "La nouvelle position est #{self.position}, la destination est #{res}, le tout en #{self.moove_type}"
    puts "----------------------------------------------------------------------"
  end

end
