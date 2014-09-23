class SiteController < ApplicationController

  before_action :is_authenticated?, except: [:index]

  def index

  end

  def show

    # if User.find(params[:user_id]) != @current_user
    #   redirect_to user_path(current_user.id)
    # else
      @user = @current_user
      @articles = Article.all
    # end

  end

end
