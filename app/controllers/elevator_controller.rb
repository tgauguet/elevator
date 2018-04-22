class ElevatorController < ApplicationController

  def show
    @elevator = Elevator.last
    @inside_calls = @elevator.calls.where(inside: true)
                                    .where(completed: false)
    @outside_calls = @elevator.calls.where(inside: false)
                                    .where(completed: false)
  end

end
