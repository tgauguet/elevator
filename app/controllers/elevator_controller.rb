class ElevatorController < ApplicationController

  def show
    @elevators = Elevator.all.order("created_at ASC")
  end

end
