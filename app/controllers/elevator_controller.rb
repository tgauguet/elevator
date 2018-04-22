class ElevatorController < ApplicationController

  def show
    @elevator = Elevator.last
    @inside_calls = @elevator.calls.inside.uncomplete
    @outside_calls = @elevator.calls.outside.uncomplete
  end

end
