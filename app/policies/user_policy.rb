class UserPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index?
    @user.has_role? :admin
  end

  alias destroy? index?

  # def is_bd
  #   @user.has_role? :bd
  # end

  # def is_admin
  #   @user.has_role? :admin
  # end

end
