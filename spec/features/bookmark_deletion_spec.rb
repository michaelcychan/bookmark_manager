# ./spec/features/bookmark_deletion_spec.rb

feature 'Bookmark deletion' do
  scenario 'A user can remove an existing bookmark' do
    Bookmarks.create(url: 'http://www.google.com', title: 'Google Inc.')
    visit('/bookmarks')
    expect(page).to have_link('Google Inc.', href: 'http://www.google.com')

    first('.bookmark').click_button 'Delete'
    expect(current_path).to eq '/bookmarks'
    expect(page).not_to have_link('Google Inc.', href: 'http://www.google.com')
  end
end