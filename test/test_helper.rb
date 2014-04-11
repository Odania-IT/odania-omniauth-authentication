# Configure Rails Environment
ENV['RAILS_ENV'] = 'test'

require File.expand_path('../dummy/config/environment.rb', __FILE__)
require 'rails/test_help'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'minitest/reporters'
MiniTest::Reporters.use!


# Test Setup
require "#{Gem.loaded_specs['odania_core'].full_gem_path}/test/support/test_setup.rb"

# Setup database cleaner
DatabaseCleaner.strategy = :truncation
module DatabaseCleanerModule
	def before_setup
		DatabaseCleaner.start
	end

	def after_teardown
		DatabaseCleaner.clean
		Odania::Controllers::UrlHelpers.class_variable_set(:@@current_site, nil)
	end
end

class MiniTest::Unit::TestCase
	include DatabaseCleanerModule
end
