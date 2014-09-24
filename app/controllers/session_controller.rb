class SessionController < ApplicationController

  def new
    if session[:user_id] != nil
      redirect_to root_path
    end
  end

  def create
    @user = User.authenticate(params[:user][:name], params[:user][:password])
    if @user
      session[:user_id] = @user.id
      # redirect_to user_path(@user.id), :notice => 'Logged in!'
            redirect_to renaissance_path, :notice => 'Logged in!'
    else
      if User.find_by_name(params[:user][:name]) == nil
        redirect_to login_path, :alert => 'Account with that name does not exist.'
      elsif User.find_by_name(params[:user][:name]).password != params[:user][:password]
        redirect_to login_path, :alert => 'Invalid password.'
      else
        redirect_to login_path, :alert => 'Could not log you in. Please try again.'
      end
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to "/", :notice => 'Logged out.'
  end
end