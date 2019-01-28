class Product2Policy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

end
