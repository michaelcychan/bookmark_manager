# ./spec/comment_spec.rb

require 'comment'
require 'bookmarks'
require_relative './database_helpers'

describe Comment do
  describe '.create' do
    it 'creates a new comment' do
      bookmark = Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      comment = Comment.create(text: 'This is a comment for the Makers Academy bookmark', bookmark_id: bookmark.id)

      persisted_data = persisted_data(table: 'comments', id: comment.id )

      expect(comment).to be_a Comment
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is a comment for the Makers Academy bookmark'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end

  describe '.where' do
    it 'gets the relevant comments from the database' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "Makers Academy")
      Comment.create(text: 'This is the first comment for Makers bookmarks', bookmark_id: bookmark.id)
      Comment.create(text: 'This is the second comment for Makers bookmarks', bookmark_id: bookmark.id)

      comments = Comment.where(bookmark_id: bookmark.id)
      comment = comments.first
      persisted_data = persisted_data(table: 'comments', id: comment.id)

      expect(comments.length).to eq 2
      expect(comment.id).to eq persisted_data.first['id']
      expect(comment.text).to eq 'This is the first comment for Makers bookmarks'
      expect(comment.bookmark_id).to eq bookmark.id
    end
  end
end