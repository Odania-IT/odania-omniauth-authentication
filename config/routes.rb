Rails.application.routes.draw do
	match '/auth/:provider/callback', to: 'odania_omniauth_authentication/sessions#create', via: [:get, :post], as: 'authentication'
	match '/logout', to: 'odania_omniauth_authentication/sessions#destroy', via: [:get, :post], as: 'logout'
	get '/sign_up', to: 'odania_omniauth_authentication/sessions#new', as: 'sign_up'
end
