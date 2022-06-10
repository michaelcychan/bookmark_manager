# ./lib/database_connection_setup.rb

require_relative './database_connection'

if ENV['ENVIRONMENT'] == 'test'
  DatabaseConnection.setup('bookmark_manager_test')
else
  DatabaseConnection.setup('bookmark_manager')
end