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

  alias update? create?

  def assign_engineer?
    is_bd || is_admin || is_manager
  end

  alias destroy? assign_engineer?

  private

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
