class LeadsController < ApplicationController
  respond_to :json

  def index
    user = set_user_from_token
    @leads = Lead.all
    render json: @leads
  end

  def create
    authorize Lead.new
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

  def loggedIn
    user = get_user_from_token
    render json: {
      message: "If you see this, you're in!!",
      user: user
    }
  end

  private

  def set_lead_params
    params.require(:lead).permit!
  end

  private

  def set_user_from_token
    jwt_payload = JWT.decode(request.headers['Authorization'].split(' ')[1],
      Rails.application.credentials.devise[:jwt_secret_key]).first
      user_id = jwt_payload['sub']
      current_user = User.find(user_id.to_s)
  end

end
