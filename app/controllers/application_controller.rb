class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :check_auth

  def check_auth
    login = cookies[:login]

    if login
      @activeUser = Usuario.find(login)
      cookies[:login] = {value: @activeUser.id, expires: Time.now + 900}
    else
      redirect_to login_path unless request.original_url == login_url
    end
  end
end
