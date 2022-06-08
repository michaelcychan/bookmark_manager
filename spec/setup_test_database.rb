# ./spec/setup_test_database.rb

require 'pg'

def setup_test_database
  # connect to the testing database, not dev database
  connection = PG.connect(dbname: 'bookmark_manager_test')
  # truncate the testing database - bookmarks
  connection.exec('TRUNCATE bookmarks;')
end
