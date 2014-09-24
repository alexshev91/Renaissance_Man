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
      if (@user.technology > 50 && @user.science > 50 && @user.movies > 50)
          @userLevel = 11
        elsif (@user.technology > 45 && @user.science > 45 && @user.movies > 45)
          @userLevel = 10
        elsif (@user.technology > 40 && @user.science > 40 && @user.movies > 40)
          @userLevel = 9
        elsif (@user.technology > 35 && @user.science > 35 && @user.movies > 35)
          @userLevel = 8
        elsif (@user.technology > 30 && @user.science > 30 && @user.movies > 30)
          @userLevel = 7
        elsif (@user.technology > 25 && @user.science > 25 && @user.movies > 25)
          @userLevel = 6
        elsif (@user.technology > 20 && @user.science > 20 && @user.movies > 20)
          @userLevel = 5
        elsif (@user.technology > 15 && @user.science > 15 && @user.movies > 15)
          @userLevel = 4
        elsif (@user.technology > 10 && @user.science > 10 && @user.movies > 10)
          @userLevel = 3
        elsif (@user.technology > 5 && @user.science > 5 && @user.movies > 5)
          @userLevel = 2
        elsif (@user.technology > 0 && @user.science > 0 && @user.movies > 0)
          @userLevel = 1
        else
          @userLevel = 0
        end
    # end

  end

end
