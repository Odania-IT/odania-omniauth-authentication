source 'https://rubygems.org'

# Declare your gem's dependencies in odania_omniauth_authentication.gemspec.
# Bundler will treat runtime dependencies like base dependencies, and
# development dependencies will be added by default to the :development group.
gemspec

# Declare any dependencies that are still in development here instead of in
# your gemspec. These might include edge Rails or gems from your path or
# Git. Remember to move these dependencies to your gemspec before releasing
# your gem to rubygems.org.

# To use debugger
# gem 'debugger'

group :development, :test do
	gem 'factory_girl_rails'
	gem 'minitest'
	gem 'minitest-reporters'
	gem 'database_cleaner'
	gem 'odania_core', git: 'https://github.com/Odania-IT/odania-core.git', branch: 'develop'
	gem 'omniauth'
	gem 'omniauth-identity'

	# Necessary for travis
	platforms :jruby do
		gem 'activerecord-jdbcsqlite3-adapter'
		gem 'activerecord-jdbcmysql-adapter'
		gem 'activerecord-jdbcpostgresql-adapter'
		gem 'jruby-openssl'
	end

	platforms :mri do
		gem 'sqlite3'
		gem 'mysql2'
		gem 'pg'
	end
end


gem 'paperclip'
