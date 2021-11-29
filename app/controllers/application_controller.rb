class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in?

  def current_user
    if session[:user_id]
      @current_user ||= User.find(session[:user_id])
    end
  end

  def logged_in?
    !!current_user
  end

  def require_user
    if !logged_in?
      flash[:warning] = 'Musisz być zalogowany aby wykonać tą akcję.'
      redirect_to login_path
    end
  end
end
