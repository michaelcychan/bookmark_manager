# lib/bookmarks.rb
require 'pg'
require_relative './database_connection.rb'

class Bookmarks
  attr_reader :id, :url, :title

  def initialize(id:, url:, title:)
    @id = id
    @url = url
    @title = title
  end

  def self.all
    result = DatabaseConnection.query('SELECT * from bookmarks')
    result.map { |bookmark| Bookmarks.new(id: bookmark['id'], url: bookmark['url'], title: bookmark['title']) }
  end

  def self.create(url:, title:)
    result = DatabaseConnection.query("INSERT INTO bookmarks (title, url) VALUES($1, $2) RETURNING id, title, url;", [title, url])
    # exec_params works against SQL injection.
    # First part is the SQL template, with $1.. $n being variables,
    # second part is an array containing the variables
    Bookmarks.new(url: result[0]['url'], id: result[0]['id'], title: result[0]['title'])
  end

  def self.delete(id:)
    DatabaseConnection.query("DELETE FROM bookmarks WHERE id = $1", [id])
  end

  def self.update(id:, title:, url:)
    result = DatabaseConnection.query("UPDATE bookmarks SET url = $1, title = $2 WHERE id = $3 RETURNING id, title, url", [url, title, id])
    Bookmarks.new(url: result[0]['url'], id: result[0]['id'], title: result[0]['title'])
  end

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM bookmarks WHERE id = $1", [id])
    Bookmarks.new(url: result[0]['url'], id: result[0]['id'], title: result[0]['title'])
  end
end
