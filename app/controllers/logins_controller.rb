class LoginsController < ApplicationController

before_action :not_redirect_if_already_log_in, only: [:create]

  def new
    @headline = 'Login'
    @error_message = "Please Login" if params[:authorized]
    @error_message = "Already Login" if params[:login]
  end

  def create
    user = User.find_by(username: params[:login][:username])
      if user && user.authenticate(params[:login][:password])
        log_in user


      redirect_to projects_path
    else
      flash[:error] = 'Invalid username. Please retry!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to login_path
  end
end