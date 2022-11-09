class LeadsController < ApplicationController

  def index
    @leads = Lead.all
    render json: @leads
  end

  def create
    @lead = Lead.new set_lead_params
    if @lead.save
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  def show
    @lead = Lead.find_by(id: params[:id])
    render json: @lead.phases
  end

  private

  def set_lead_params
    params.require(:lead).permit!
  end

end
