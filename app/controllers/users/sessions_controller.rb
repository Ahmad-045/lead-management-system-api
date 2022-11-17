class Users::SessionsController < Devise::SessionsController
  respond_to :json

  def respond_with(_resource, _opts={})
    # byebug
    # render json: { status: :unauthorized} unless current_user
    # @data = UserSerializer.new(current_user)
    # byebug
    if current_user
      render json: {
        message: "You are logged in. ",
        user: ActiveModelSerializers::SerializableResource.new(current_user, serializer: UserSerializer)
      }, status: :ok

    else
      render json: { status: :unauthorized }
    end
  end

  private

  def respond_to_on_destroy
    log_out_success && return if current_user

    log_out_failure
  end

  def log_out_success
    render json: { message: "You are logged out."}, status: :ok
  end

  def log_out_failure
    render json: { message: 'Hmm nothing happned. '}, status: :unauthorized
  end

end
