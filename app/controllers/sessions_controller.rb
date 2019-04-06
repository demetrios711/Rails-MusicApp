class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(params[:user][:email])
    if user
      login(user)
      redirect_to :bands
    else 
      flash.now[:errors] = "Incorrect username or password"
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_url
  end

  def new
  end
end
