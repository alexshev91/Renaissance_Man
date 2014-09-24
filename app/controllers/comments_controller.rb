class CommentsController < ApplicationController
  before_action :find_parent

  def create
    @parent.comments.create(comment_params)
    redirect_to renaissance_path
  end

  def find_parent
    @parent = @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end


end
