class SessionsController < ApplicationController
  def create
    #to check the request's environment variables
    raise env['omniauth.auth'].to_yaml
  end


end