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
    result = connection.exec_params("INSERT INTO bookmarks (title, url) VALUES($1, $2) RETURNING id, title, url;", [title, url])
    # exec_params works against SQL injection.
    # First part is the SQL template, with $1.. $n being variables, 
    # second part is an array containing the variables
    Bookmarks.new(url: result[0]['url'], id: result[0]['id'], title: result[0]['title'])
  end

  def self.delete(id:)
    if ENV['ENVIRONMENT'] == 'test'
      connection = PG.connect(dbname: 'bookmark_manager_test')
    else 
      connection = PG.connect(dbname: 'bookmark_manager')
    end
    connection.exec_params("DELETE FROM bookmarks WHERE id = $1", [id])
  end

end
