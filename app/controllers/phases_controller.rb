class PhasesController < ApplicationController

  def create
    @phase = Phase.create set_phase_params
    if @phase.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end


  private
  def set_phase_params
    params.require(:phase).permit!
  end
end
