class SessionsController < ApplicationController
  def new
  end

  def create
  	user = User.find_by(email: params[:session][:email].downcase)
  	if user && (user.name.downcase == params[:session][:name].downcase)
  		#create session and redirect to user page
      log_in user
      redirect_to user
  	else
  		flash.now[:danger] = 'Invalid name or email'
  		render 'new'
  	end
  end

  #we already have a user logged in, and we want to logoff
  #redirect to the root
  def destroy
    log_out
    redirect_to root_url
  end
end
