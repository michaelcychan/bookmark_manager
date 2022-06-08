# ./spec/bookmark_spec.rb

require './lib/bookmarks'

describe '.all' do
  it 'returns a list of bookmarks' do
    # connect to testing DB and insert testing db entries
    connection = PG.connect(dbname: 'bookmark_manager_test')
    bookmark_test = Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy').first
    Bookmarks.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com', title: "Google")
    
    # Unit test for Bookmark class
    bookmarks = Bookmarks.all
    expect(bookmarks.size).to eq 3
    expect(bookmarks.first).to be_a Bookmarks
    expect(bookmarks.first.id).to eq bookmark_test['id']
    expect(bookmarks.first.url).to eq "http://www.makersacademy.com"
    expect(bookmarks.first.title).to eq "Makers Academy"
  end
end

describe '.create' do
  it 'creates a bookmark and returns it' do
    bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "The Makers Academy").first
    # Unit test for Bookmark class
    expect(bookmark['url']).to eq "http://www.makersacademy.com"
    expect(bookmark['title']).to eq  "The Makers Academy"
  end
end
