class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def login!
    session[:session_token] = user.reset_session_token!
  end

  def current_user
    @current_user ||= User.find_by(session_token: session[:session_token])
  end
  
end
