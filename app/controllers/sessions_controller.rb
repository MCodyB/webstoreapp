class SessionsController < ApplicationController

  def create
    user = User.find_by_email(params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      flash.notice = 'logged in'
      redirect_to user
    else
      flash.now[:error] = 'Invalid email/password combination'
      render :new
    end
  end
  
  def destroy
    sign_out
    redirect_to root_url
  end
end