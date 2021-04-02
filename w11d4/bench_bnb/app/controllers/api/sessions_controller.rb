class Api::SessionsController < ApplicationController
  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user
      login!(@user)
      render 'api/users/show'
    end
  end

  def destroy
    if logout!
      render {}
    else
      render json: @user.errors, status: 404
  end
end
