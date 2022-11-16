class LeadPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    is_bd || is_admin
  end

  # alias destroy? create?
  def destroy?
    is_admin || created_by_this_user?
  end

  private

  def created_by_this_user?
    @record.user === @user
  end

  def is_bd
    @user.has_role? :bd
  end

  def is_admin
    @user.has_role? :admin
  end
end
