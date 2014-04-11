Rails.application.routes.prepend do
	OdaniaOmniauthAuthentication::Engine.routes
end
