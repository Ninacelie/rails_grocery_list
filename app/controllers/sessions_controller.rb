class SessionsController < ApplicationController

  def home
  end 

  def logout #logout action / method 
    session.clear
    redirect_to root_path
  end 

  def create
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:message] = "Incorrect login info, please try again!"
      redirect_to '/login'
    end 
  end 

  def create_from_omniauth
    @user = User.find_or_create_by(email: auth_hash[:info][:email]) do |u|
        u.username = auth_hash[:info][:email] 
        u.password = SecureRandom.hex
    end 
    if @user.persisted?
      session[:user_id] = @user.id
      redirect_to "/users/#{@user.id}"
    else
      flash[:message] = "Incorrect login info, please try again!"
      redirect_to '/login'
    end
  end 

  private

  def auth_hash
    request.env['omniauth.auth']
  end 

end 
  