module OdaniaOmniauthAuthentication
	class Strategy
		def self.available_providers
			OmniAuth::Strategies.constants.reject { |item| item =~ /Developer|OAuth2|Oauth/i }
		end

		def self.remaining_providers(user)
			OdaniaOmniauthAuthentication.available_providers - OdaniaOmniauthAuthentication::UserAuthentication.where(user_id: user.id).pluck(:provider)
		end
	end
end
