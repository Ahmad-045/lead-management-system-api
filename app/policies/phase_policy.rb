class PhasePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    is_bd || is_admin
  end

  def update?
    is_bd || is_admin
  end

  def assign_engineer?
    is_bd || is_admin || is_manager
  end

  def is_bd
    @user.has_role? :bd
  end

  def is_admin
    @user.has_role? :admin
  end

  def is_manager
    @user.has_role? :manager
  end

end
