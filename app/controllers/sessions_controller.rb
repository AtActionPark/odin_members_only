class SessionsController < ApplicationController

  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      flash[:success] = 'Welcome !'
      sign_in user
      redirect_to root_path
    else
      flash.now[:danger] = 'email/password combination incorrect'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_path
  end
  
end
