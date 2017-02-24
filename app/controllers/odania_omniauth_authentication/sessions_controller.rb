require_dependency "odania_omniauth_authentication/application_controller"

module OdaniaOmniauthAuthentication
	class SessionsController < ApplicationController
		skip_before_action :verify_authenticity_token, :only => :create
		before_action :valid_site!

		def new
		end

		def create
			auth = request.env['omniauth.auth']
			# Find an identity here
			@identity = OdaniaOmniauthAuthentication::UserAuthentication.find_with_omniauth(auth)

			if @identity.nil?
				# If no identity was found, create a brand new one here
				@identity = OdaniaOmniauthAuthentication::UserAuthentication.create_with_omniauth(auth)
			end

			if user_signed_in?
				if @identity.user == current_user
					# User is signed in so they are trying to link an identity with their
					# account. But we found the identity and the user associated with it
					# is the current user. So the identity is already associated with
					# this user. So let's display an error message.
					return redirect_back_or_default('Already linked that account')
				else
					# The identity is not associated with the current_user so lets
					# associate the identity
					@identity.user = current_user
					@identity.save!
					return redirect_back_or_default(t('Successfully linked that account'))
				end
			else
				if @identity.user.present?
					# The identity we found had a user associated with it so let's
					# just log them in here
					set_current_user(@identity.user)
					return redirect_back_or_default(t('Signed in'))
				else
					# No user associated with the identity so we need to create a new one
					user = Odania::User.new
					user.ip = request.remote_ip
					user.email = auth['info']['email']
					user.name = auth['info']['name']
					user.save!

					@identity.user_id = user.id
					@identity.save!

					set_current_user(user)

					return redirect_back_or_default(t('Signed in'))
				end
			end
		end

		def destroy
			set_current_user(nil)
			redirect_back_or_default('Signed out')
		end

		protected

		def redirect_back_or_default(notice)
			redirect_to (session[:return_to] || root_path), notice: notice
		end

		def auth_hash
			request.env['omniauth.auth']
		end

		def set_current_user(user)
			@current_user = user

			if user.nil?
				session[:user_id] = nil
			else
				user.last_login = Time.now
				user.ip = request.remote_ip
				user.save!

				session[:user_id] = user.id
			end
		end
	end
end
