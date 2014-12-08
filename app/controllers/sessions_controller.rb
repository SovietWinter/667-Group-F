class SessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def new
  end

  def create
    user = User.find_by(username: params[:session][:username].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to "/"
    else
      flash[:login_error] = 'invalid user credentials'
      redirect_to "/"
    end
  end

  def destroy
    log_out if logged_in?
    render json: {success: true}
  end
end
