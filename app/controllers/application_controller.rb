class ApplicationController < ActionController::API
  before_action :authenticate_user!

  # protect_from_forgery with: :null_session
end
