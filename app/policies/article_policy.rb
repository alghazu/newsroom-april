class ArticlePolicy < ApplicationPolicy
  def show?
    record.published || user == record.user || user.editor?
  end

  def new?
    user.editor? || user.journalist?
  end

  def create?
    new?
  end

  def edit?
    user.editor? || (user.journalist? && record.user == user)
  end

  def update?
    edit?
  end

  def destroy?
    user.editor?
  end
end
