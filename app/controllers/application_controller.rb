class ApplicationController < ActionController::API
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  # rescue_from ActiveRecord::RecordNotUnique, with: :record_not_unique

  # private
  # def record_not_unique
  #   render json: {data: 'Record Not Unique', status: :conflict}
  # end
  # protect_from_forgery with: :null_session
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |u|
      u.permit(:username, :email, :password, :password_confirmation, :contact)
    end
  end
end
