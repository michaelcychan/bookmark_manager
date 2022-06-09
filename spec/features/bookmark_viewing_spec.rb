# in spec/features/bookmarks_viewing_spec.rb

feature 'Viewing bookmarks' do
  scenario 'A user can see all bookmarks' do
    Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmarks.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com', title: 'Google Search Engine')

    visit('/bookmarks')
    expect(page).to have_link('Makers Academy', href: 'http://www.makersacademy.com')
    expect(page).to have_link('Destroy All Software', href: 'http://www.destroyallsoftware.com')
    expect(page).to have_link('Google Search Engine', href: 'http://www.google.com')
  end
end