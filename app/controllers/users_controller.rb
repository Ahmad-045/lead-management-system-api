class UsersController < ApplicationController
  respond_to :json
  # before_action :filter_users, only: %i[index]

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

  def get_managers
    @manager = User.with_role :manager
    render json: @manager
  end

  def get_engineers
    @engineers = User.with_role :engineer
    render json: @engineers
  end

  private

  def assign_new_roles_to_user(user)
    params[:data].each do |role|
      @user.add_role role
    end
  end


  # GET /users/role=manager
  # def filter_users
  #   if request.query_string.present?
  #     @filter_params = CGI.parse(request.query_string)
  #     @desired_user_role = @filter_params['role'][0].parameterize.underscore.to_sym
  #     @users = User.with_role @desired_user_role
  #   else
  #     @users = User.all
  #   end
  # end
end
