require 'odania_omniauth_authentication/helper'
require 'odania_omniauth_authentication/engine'
require 'odania_omniauth_authentication/strategy'

module OdaniaOmniauthAuthentication
	def self.table_name_prefix
		'odania_omniauth_'
	end
end
