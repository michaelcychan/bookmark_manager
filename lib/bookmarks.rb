# lib/bookmarks.rb
require 'pg'

class Bookmarks
  attr_reader :id, :url, :title
  
  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec('SELECT * from bookmarks')
    result.map { |bookmark| Bookmarks.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    result = connection.exec("INSERT INTO bookmarks (title, url) VALUES('#{title}', '#{url}') RETURNING id, url, title")
    Bookmarks.new(url: result[0]['url'], id: result[0]['id'], title: result[0]['title'])
  end

end
