class CallsController < ApplicationController
  before_action :set_elevator, only: [:create, :destroy]

  def create
    @call = @elevator.calls.create(call_params)

    if @call.save
      flash[:success] = "Call successfully created."
    else
      flash[:error] = "Error while creating new call."
    end
    redirect_to root_url
  end

  def destroy
    @call = Call.find(params[:id])
    @call.destroy
    redirect_to root_url
  end

  private

  def call_params
    params.require(:call).permit(:call_type, :floor_num, :elevator_id)
  end

  def set_elevator
    @elevator = Elevator.find(params[:elevator_id])
  end

end
