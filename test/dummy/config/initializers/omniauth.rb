Rails.application.config.middleware.use OmniAuth::Builder do
	provider :identity, :fields => [:email, :name], :model => OdaniaOmniauthAuthentication::Identity,
				:on_failed_registration =>  OdaniaOmniauthAuthentication::SessionsController.action(:new)
end
OmniAuth.config.logger = Rails.logger
