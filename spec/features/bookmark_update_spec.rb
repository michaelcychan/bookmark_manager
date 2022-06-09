# ./spec/features/bookmark_update_spec.rb

feature 'Bookmark update' do
  scenario 'A user can update an existing bookmark' do
    bookmark = Bookmarks.create(url: 'http://www.google.com', title: 'Google Inc.')
    visit('/bookmarks')
    expect(page).to have_link('Google Inc.', href: 'http://www.google.com')
    first('.bookmark').click_button 'Edit'

    #to a new page
    # expect(current_path).to eq "/bookmarks/#{bookmark.id}/edit"

    fill_in('title', with: 'Google')
    fill_in('url', with: 'https://www.google.co.uk/')
    click_button 'Update'
# fill in update information?

    expect(current_path).to eq '/bookmarks'
    expect(page).to have_link('Google', href: 'https://www.google.co.uk/')
  end
end