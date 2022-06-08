# in spec/features/bookmarks_viewing_spec.rb

feature 'Viewing bookmarks' do
  scenario 'A user can see all bookmarks' do
    Bookmarks.create(url: 'http://www.makersacademy.com')
    Bookmarks.create(url: 'http://www.destroyallsoftware.com')
    Bookmarks.create(url: 'http://www.google.com')

    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end