class RoomsLoyalty < ApplicationLoyalty
  def index?
    user&.is_admin? && record
  end

  def edit?
    user&.is_admin?
  end

  def update?
    user&.is_admin? && record
  end

  def new?
    user&.is_admin?
  end

  def create?
    user&.is_admin?
  end

  def destroy?
    user&.is_admin?
  end
end
