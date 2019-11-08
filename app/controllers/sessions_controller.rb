class SessionsController < ApplicationController
  def create
    user = User.find_by(email: params[:session][:email])
    if user
      if user.authenticate(params[:session][:password])
        session[:user_id] = user.id
        flash[:success] = "Welcome #{user.first_name}!"
        redirect_to root_path
      else
        flash[:error] = 'Password is not correct!'
        redirect_to login_path
      end
    else
      flash[:error] = 'E-mail dont exists!'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    session[:cart_id] = nil
    redirect_to login_path, notice: 'You are logged out'
  end
end
