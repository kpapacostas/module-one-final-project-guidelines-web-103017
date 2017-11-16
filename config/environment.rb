require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
ActiveRecord::Migration.verbose = false
ActiveRecord::Base.logger = nil

require_all 'lib'
