module SessionsHelper
  def log_in(user, role)
    session[:user_id] = user.id
    session[:role] = role
  end

  def current_user
    if session[:user_id]
      if session[:role]=='Customer'
        @current_user ||= Customer.find_by(id: session[:user_id])
      else if session[:role]=='Agent'
        @current_user ||= Agent.find_by(id: session[:user_id])
      else
        @current_user ||= Admin.find_by(id: session[:user_id])
      end
      end
    end
  end

  def logged_in?
    !current_user.nil?
    # cookies[:role]
  end

  def log_out
    session.delete :user_id
    session.delete :role
    @current_user = nil
  end

end