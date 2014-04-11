module OdaniaOmniauthAuthentication
	module Helper
		def current_omniauth_user
			@current_user ||= Odania::User.find_by(id: session[:user_id])
		end

		def omniauth_signed_in?
			!!current_user
		end

		def user_authenticated_filter(opts)
			unless omniauth_signed_in?
				session[:return_to] = request.path
				return redirect_to '/sign_up', notice: 'Not authorized'
			end
		end
	end
end
