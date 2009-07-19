class AdminController < ApplicationController 
  before_filter :authenticate
  
  def login
    session[:admin] = "true"
    flash[:success] = "You are logged in as Administrator"
    redirect_to '/'
  end
  
  def logout
    session[:admin] = nil
    flash[:success] = "You are logged out"
    redirect_to '/'
  end 
  
  protected
  
  def authenticate
    authenticate_or_request_with_http_basic do |username, password|
      username == "foo" && password == "bar"
    end    
  end
end