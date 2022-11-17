class UsersController < ApplicationController
  respond_to :json
  before_action :filter_users, only: %i[user_with_role]

  def index
    authorize User
    @users = User.all
    render json: @users
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.roles = []
    assign_new_roles_to_user(@user)
    render json: :ok
  end

  def destroy
    @user = User.find_by(id: params[:id])
    authorize @user
    if @user.destroy
      render json: {status: :ok}
    else
      render json: {status: :error}
    end
  end

  def user_with_role
    render json: @users_with_desired_role
  end

  private

  def assign_new_roles_to_user(user)
    params[:data].each do |role|
      @user.add_role role
    end
  end


  # GET /user_with_role/?role=manager
  def filter_users
    if request.query_string.present?
      @filter_params = CGI.parse(request.query_string)
      @desired_user_role = @filter_params['role'][0].parameterize.underscore.to_sym
      @users_with_desired_role = User.with_role @desired_user_role
    end
  end
end
