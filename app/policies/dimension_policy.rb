class DimensionPolicy < ApplicationPolicy

  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    true
  end
  
<<<<<<< HEAD
=======
  def listings?
    update?
  end
  
>>>>>>> master

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
