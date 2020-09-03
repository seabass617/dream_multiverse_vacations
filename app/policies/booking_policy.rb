class BookingPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end
  
  def new?
    record.dimension.user != user
  end
  
  def create?
    new?
  end

  def edit?
    update?
  end
  
  def update?
    record.user == user
  end

  def destroy?
    update?
  end

end
