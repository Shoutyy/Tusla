class ProductPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    true
  end

  def create?
    if user.seller?
      true
    end
  end

  def update?
    true
  end

  def destroy?
    true
  end
end
