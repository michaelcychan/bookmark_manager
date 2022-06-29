# ./lib/comment.rb

require 'pg'
require_relative './database_connection'

class Comment
  attr_reader :text, :id, :bookmark_id

  def initialize(bookmark_id:, id:, text:)
    @bookmark_id = bookmark_id
    @id = id
    @text = text
  end
  
  def self.create(bookmark_id:, text:)
    result = DatabaseConnection.query(
      "INSERT INTO comments (bookmark_id, text) VALUES ($1, $2) RETURNING id, text, bookmark_id",
      [bookmark_id, text]
    )
    comment = Comment.new(
      id: result[0]['id'],
      bookmark_id: result[0]['bookmark_id'],
      text: result[0]['text']
    )
  end

  def self.where(bookmark_id:)
    result = DatabaseConnection.query(
      "SELECT * from comments WHERE bookmark_id = $1",
      [bookmark_id]
    )
    result.map do |each_comment|
      Comment.new(
        id: each_comment['id'],
        text: each_comment['text'],
        bookmark_id: each_comment['bookmark_id']
      )
    end
  end
end
