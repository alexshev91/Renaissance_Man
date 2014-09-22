class UsersController < ApplicationController

    before_action :is_authenticated?, except: [:new, :create]

  def new
    if session[:user_id] != nil
      redirect_to user_path(current_user.id)
    else
      @user = User.new
    end
  end

  def create
    if session[:user_id] == nil
      new_user = params.require(:user).permit(
        :name,
        :password,
        :password_confirmation
      )
      @user = User.new(new_user)
      if @user.save
        auth_user = User.authenticate(@user.name, @user.password)
        if auth_user
          session[:user_id] = @user.id
          redirect_to user_path(@user.id), :notice => 'Profile created!'
        end
      else
        if User.find_by_name(@user.name)
          redirect_to signup_path, :alert => 'An account with that email already exists.'
        elsif @user.password.length < 6
          redirect_to signup_path, :alert => 'Password must be at least 6 characters.'
        elsif @user.password != @user.password_confirmation
          redirect_to signup_path, :alert => 'Password must match password confirmation.'
        end
      end
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please log in again.'
    end
  end

  def show
    if User.find(params[:id]) != @current_user
      redirect_to user_path(current_user.id)
    else
      @user = @current_user
    end
  end

  def edit
    if User.find(params[:id]) != @current_user
      redirect_to edit_user_path(current_user.id)
    else
      @user = @current_user
    end
  end

  def update
    if User.find(params[:id]) == @current_user
      @user = @current_user
      updated_user = params.require(:user).permit(
        :name,
        :password,
        :password_confirmation
      )
      @user.update_attributes(
        :name => updated_user[:name],
        :password   => updated_user[:password],
        :password_confirmation   => updated_user[:password_confirmation]
      )
      redirect_to user_path, :notice => 'Profile updated!'
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please log in again.'
    end
  end

  def destroy
    if User.find(params[:id]) == @current_user
      @user = @current_user
      @user.destroy
      session[:user_id] = nil
      redirect_to root_path, :notice => 'Profile deleted.'
    else
      session[:user_id] = nil
      redirect_to login_path, :notice => 'Please log in again.'
    end
  end

end
