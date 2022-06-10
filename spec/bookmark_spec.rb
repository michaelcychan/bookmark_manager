# ./spec/bookmark_spec.rb

require './lib/bookmarks'

describe '.all' do
  it 'returns a list of bookmarks' do
    # connect to testing DB and insert testing db entries
    connection = PG.connect(dbname: 'bookmark_manager_test')
    bookmark_test = Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmarks.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com', title: 'Google')
    
    # Unit test for Bookmark class
    bookmarks = Bookmarks.all
    expect(bookmarks.size).to eq 3
    expect(bookmarks.first).to be_a Bookmarks
    expect(bookmarks.first.id).to eq bookmark_test.id
    expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    expect(bookmarks.first.title).to eq 'Makers Academy'
  end
end

describe '.create' do
  it 'creates a bookmark and returns it' do
    bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "The Makers Academy")
    persisted_data = PG.connect(dbname: 'bookmark_manager_test').query("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
    # Unit test for Bookmark class
    expect(bookmark).to be_a Bookmarks
    expect(bookmark.id).to eq persisted_data.first['id']
    expect(bookmark.url).to eq 'http://www.makersacademy.com'
    expect(bookmark.title).to eq 'The Makers Academy'
  end

  it 'does not create a bookmark with an invalid url' do
    Bookmarks.create(url: "NOT/a/valid/website", title: "Not a title")
    expect(Bookmarks.all).to be_empty
  end

  describe '.delete' do
    it 'deletes a bookmark' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "The Makers Academy")
      Bookmarks.delete(id: bookmark.id)
      expect(Bookmarks.all.length).to eq 0
    end
  end

  describe '.update' do
    it 'updates a bookmark' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "The Makers Academy")
      expect(bookmark.title).to eq "The Makers Academy"

      bookmark_new = Bookmarks.update(id: bookmark.id, title: 'Google', url: "http://www.google.com")
      expect(bookmark_new).to be_a Bookmarks
      expect(bookmark_new.title).to eq "Google"
      expect(bookmark_new.url).to eq "http://www.google.com"
    end
  end

  describe '.find' do
    it 'finds a bookmark entry with the id' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "The Makers Academy")
      result = Bookmarks.find(id: bookmark.id)

      expect(result.id).to eq bookmark.id
      expect(result.title).to eq "The Makers Academy"
      expect(result.url).to eq "http://www.makersacademy.com"
    end
  end

  describe '.comments' do
    it 'it returns a list of comments on the bookmark' do
      bookmark = Bookmarks.create(url: "http://www.makersacademy.com", title: "The Makers Academy")
      DatabaseConnection.query(
        "INSERT INTO comments (id, text, bookmark_id) VALUES($1, $2, $3)",
        [1, 'My Coding Bootcamp', bookmark.id]
      )

      result = bookmark.comments.first['text']
      expect(result).to eq "My Coding Bootcamp"
    end
  end


end
