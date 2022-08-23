class ToolPolicy < ApplicationPolicy
  class Scope < Scope
    # NOTE: Be explicit about which records you allow access to!
    def resolve
      scope.all
    end
  end

  def index
    true
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
    tool?
  end

  def update?
    tool?
  end

  def destroy?
    tool?
  end

  private

  def tool?
    record.user == user
  end
end
