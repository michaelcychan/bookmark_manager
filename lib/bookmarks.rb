# lib/bookmarks.rb

require 'pg'

class Bookmarks
  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
      puts "Testing db"
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
      puts "Dev db"
    end
    result = connection.exec('SELECT * from bookmarks;')
    result.map { |bookmark| bookmark["url"] }
  end

end
