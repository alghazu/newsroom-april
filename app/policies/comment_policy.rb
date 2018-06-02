class CommentPolicy < ApplicationPolicy
  def edit?
    user.editor?
  end

  def update?
    edit?
  end
end
