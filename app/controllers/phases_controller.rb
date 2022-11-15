class PhasesController < ApplicationController
  respond_to :json

  def create
    @phase = Phase.create set_phase_params
    authorize @phase
    if @phase.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end


  def update
    @phase = Phase.find_by(id: params[:id])
    authorize @phase
    if @phase.update set_phase_params
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  def destroy
    @phase = Phase.find_by(id: params[:id])
    authorize @phase
    if @phase.delete
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  def assign_engineer
    @phase = Phase.find_by(id: params[:data][:id])
    authorize @phase
    @phase.user_ids= @phase.user_ids | params[:data][:engIds]  # union of two arrays i.e., '|'
  end

  def get_engineer_users
    @phase = Phase.find_by(id: params[:id])
    render json: @phase.users
  end

  private
  def set_phase_params
    params.require(:phase).permit!
  end

  def extract_users_record

  end
end
