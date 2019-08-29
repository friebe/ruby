module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    puts session
  end

  def log_out
    session.delete(:user_id)
    session[:user_id] = nil
    @current_user = nil
  end

  def current_user
    if session[:user_id]
      @current_user ||= User.find_by(id: session[:user_id])
    end
  end

end