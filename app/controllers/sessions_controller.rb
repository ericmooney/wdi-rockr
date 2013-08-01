class SessionsController < ApplicationController
  # def create
  #   #to check the request's environment variables
  #   raise env['omniauth.auth'].to_yaml
  # end

  def create
    user = User.from_omniauth(env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in."
  end

end