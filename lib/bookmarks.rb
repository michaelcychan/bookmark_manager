# lib/bookmarks.rb

require 'pg'

class Bookmarks
  def self.all
    if ['ENVIORNMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * from bookmarks;')
    result.map { |bookmark| bookmark["url"] }
  end

end
