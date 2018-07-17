class AdminPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
        scope
    end
  end

  def index?
    if user.admin?
      true
    end
  end

  def show?
    if user.admin?
      true
    end
  end

  def destroy?
    if user.admin?
      true
    end
  end
end
