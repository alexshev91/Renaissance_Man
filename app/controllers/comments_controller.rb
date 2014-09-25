class CommentsController < ApplicationController
  before_action :find_parent, :is_authenticated?, except: [:index]

  def create
    x = @parent.category

    puts x
    @user = @current_user

    # @y = User.find(@user.id)
    # def increaseScore(user)
      old_score = @user[x]
      @user[x] = old_score + 5
      @user.save
    # end

    # increaseScore(@y)

 # puts "thiasdfasdlfasdl;fkjal;sdfkjals;d ;laskdfl;asjkdf;lasdkjf ;l;asdl;kfjasd;lfkj a;sdkfjlasdlk jals l;aksdfj;l aksdjfl; aksdjf ;laskdfj;laskdfj; lkja ;alsdkfjl;asdkfj ;alsdkjf ;alsdk fj;asldkjf ;alsdkfj "
 #    puts @user[x]
 #    puts @user.inspect
    # @user = @current_user
    # old_cat_score = @user.cat
    # @user.cat = old_cat_score + 5
    
    new_params = comment_params
    new_params[:user_id] = @user.id
    @parent.comments.create(new_params)
    redirect_to renaissance_path
  end

  def find_parent
    @parent = @article = Article.find_by_id(params[:article_id])
  end

  def comment_params
    params.require(:comment).permit(:content)
  end


end
