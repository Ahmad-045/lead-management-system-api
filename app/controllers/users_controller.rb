class UsersController < ApplicationController
  def index
    @users = User.all
    render json: @users
  end

  def update
    @user = User.find_by(id: params[:id])
    assign_new_roles_to_user(@user)
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
    # params[:data].each do |role|
    #   @user.add_role role
    # end
  end
end
