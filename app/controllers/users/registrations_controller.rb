class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json # Responsd JSON

  private
  def respond_with(resource, _opts = {})
    register_success && return if resource.persisted?

    register_failed
  end

  def register_success
    render json: {
      message: 'Signed up successfully',
      user: current_user
    }, status: :ok
  end

  def register_failed
    render json: {
      message: 'Something went wrong',
      error: @user.errors.messages
    }, status: :unprocessable_entity
  end

end
