class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def create?
    is_admin || created_by_this_user?
  end

  private

  def created_by_this_user?
    @record.lead.user === @user
  end

  def is_bd
    @user.has_role? :bd
  end

  def is_admin
    @user.has_role? :admin
  end

end
