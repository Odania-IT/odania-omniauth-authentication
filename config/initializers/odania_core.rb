Odania.setup do |config|
	config.user_signed_in_function = 'omniauth_signed_in?'
	config.current_user_function = 'current_omniauth_user'
	config.authenticate_user_function = 'user_authenticated_filter'
end
