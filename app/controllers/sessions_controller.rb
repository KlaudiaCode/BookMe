class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      # Flash don't work. Need to create session.errors to display login errors.
      render :new
      flash[:warning] = "Dane które podałeś są nieprawidłowe."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end
