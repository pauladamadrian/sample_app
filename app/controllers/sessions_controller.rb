class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user&.authenticate(params[:session][:password])   # <=> user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to user  # rails converts this to the route for the user's profile page (user_url(user))
    else
      flash.now[:danger] = 'Invalid email/password combination!'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
