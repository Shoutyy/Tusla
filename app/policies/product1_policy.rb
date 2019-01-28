class Product1Policy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

end
