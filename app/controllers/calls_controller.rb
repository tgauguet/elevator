class CallsController < ApplicationController

  def create
    params[:call][:elevator_id] = params[:elevator_id]
    @call = Call.create(call_params)
    redirect_back(fallback_location: root_path)
  end

  def destroy
    @call = Call.find(params[:id])
    @call.destroy
    redirect_back(fallback_location: root_path)
  end

  private

  def call_params
    params.require(:call).permit(:direction, :floor_request, :elevator_id)
  end

end
