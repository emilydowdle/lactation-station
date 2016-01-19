class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_session
  helper_method :current_user, :current_date

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def current_date
    Time.new.strftime('%D')
  end
end
