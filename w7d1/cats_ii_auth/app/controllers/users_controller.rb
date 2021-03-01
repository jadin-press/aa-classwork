class UsersController < ApplicationController
  def new
    render :new
  end

  def create
    user = User.find_by_credentials(params[:user][:user_name], params[:user][:password])
    if user
      session[:session_token] = user.session_token
      redirect_to users_url
    else
      render :new
    end
  end
end
