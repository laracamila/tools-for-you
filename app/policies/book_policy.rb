class BookPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    # def resolve
    #   scope.all
    # end
  end
  def new?
    true
  end
  def show?
    true
  end
  def create?
    true
  end
  def edit?
    book?
  end
  def update?
    book?
  end
  def destroy?
    book?
  end
  private
  def book?
    record.user == user
  end
end
