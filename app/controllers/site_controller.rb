class SiteController < ApplicationController

  before_action :is_authenticated?, except: [:index]

  def index

  end

  def show

    # if User.find(params[:user_id]) != @current_user
    #   redirect_to user_path(current_user.id)
    # else
      @user = @current_user
      # @articles = Article.all
      @technology = Article.where(category: "technology")
      @art = Article.where(category: "art")

      @science = Article.where(category: "science")

      @movies = Article.where(category: "movies")
      @medicine = Article.where(category: "medicine")
    # end

  end

end
