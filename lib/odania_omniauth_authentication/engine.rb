module OdaniaOmniauthAuthentication

	class Engine < ::Rails::Engine
		ActiveSupport.on_load(:action_controller) do
			include OdaniaOmniauthAuthentication::Helper
		end
	end
end
