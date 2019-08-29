class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  include SessionsHelper

  def redirect_if_not_logged_in
    redirect_to login_path(authorized: false ) unless current_user.present?
  end

  def not_redirect_if_already_log_in
    return unless current_user.present?
    redirect_to login_path(login: true)
  end

  def redirect_unless_admin
    redirect_to login_path unless current_user.admin?
  end

end
