# ./spec/bookmark_spec.rb

require './lib/bookmarks'

describe '.all' do
  it 'returns a list of bookmarks' do
    bookmarks = Bookmarks.all

    expect(bookmarks).to include "http://www.makersacademy.com"
    expect(bookmarks).to include "http://www.destroyallsoftware.com"
    expect(bookmarks).to include "http://www.google.com"
  end
end
