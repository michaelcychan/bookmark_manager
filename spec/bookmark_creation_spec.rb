# ./spec/bookmark__creation_spec.rb

require './lib/bookmarks'

describe '.create' do
  it 'creates a bookmark and returns it' do
    # connect to testing DB and insert testing db entries
    connection = PG.connect(dbname: 'bookmark_manager_test')
    Bookmarks.create(url: "http://www.makersacademy.com")
    # Unit test for Bookmark class
    expect(Bookmarks.all).to include "http://www.makersacademy.com"
  end
end
