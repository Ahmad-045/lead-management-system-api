class PhasePolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    is_bd_of_this_phase || is_admin
  end

  def update?
    is_admin || created_by_this_user? || is_manager_of_this_phase
  end

  def assign_engineer?
    is_admin || is_bd_of_this_phase || is_manager_of_this_phase
  end

  alias destroy? assign_engineer?

  private

  def created_by_this_user?
    @record.lead.user === @user
  end

  def is_bd_of_this_phase
    (@user.has_role? :bd) && created_by_this_user?
  end

  def is_admin
    @user.has_role? :admin
  end

  def is_manager_of_this_phase
    (@user.has_role? :manager) && (@record.manager === @user)
  end

end
