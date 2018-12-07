class VideosLoyalty < ApplicationLoyalty
  def index?
    user&.is_admin? || user.purchased?(record.id) || record.is_free?
  end

  def show?
    user&.is_admin? || user.purchased?(record.id) || record.is_free?
  end

  def update?
    user&.is_admin?
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
