module SessionsHelper
	#login session with user
	def log_in(user)
		session[:user_id] = user.id
	end

	#self explanatory: remove from session and set login status to nil
	def log_out
		session.delete(:user_id)
		@current_user = nil
	end

	#returns current logged in user
	def current_user
		@current_user ||= User.find_by(id: session[:user_id])
	end

	#boolean of login status: true = logged in, false = logged off
	def logged_in?
		!current_user.nil?
	end

end
