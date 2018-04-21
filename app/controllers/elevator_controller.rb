class ElevatorController < ApplicationController

  def show
    @elevator = Elevator.last
    @calls = @elevator.calls
  end

end
