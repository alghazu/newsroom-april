class DashboardsController < ApplicationController
  def editor
    @articles = Article.where(published: false)
    @comments = Comment.where(published: false)
  end
end
