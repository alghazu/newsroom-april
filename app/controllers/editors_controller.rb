class EditorsController < ApplicationController
  def index
    @articles = Article.where(published: false)
    @comments = Comment.where(published: false)
  end
end
