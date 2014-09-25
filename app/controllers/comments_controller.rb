class CommentsController < ApplicationController
  before_action :find_parent, :is_authenticated?, except: [:index]

  def create
    x = @parent.category

    puts x
    @user = @current_user


      old_score = @user[x]
      @user[x] = old_score + 5
      @user.save

    new_params = comment_params
    new_params[:user_id] = @user.id

   render json:  @parent.comments.create(new_params).as_json.merge(name: @user.name)


  end

  def find_parent
    @parent = @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end


end
