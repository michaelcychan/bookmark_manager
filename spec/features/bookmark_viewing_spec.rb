# in spec/features/bookmarks_viewing_spec.rb

feature 'Viewing bookmarks' do
  scenario 'A user can see all bookmarks' do
    Bookmarks.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmarks.create(url: 'http://www.destroyallsoftware.com', title: 'Destroy All Software')
    Bookmarks.create(url: 'http://www.google.com', title: 'Google Search Engine')

    visit('/bookmarks')
    expect(page).to have_content "Makers Academy"
    expect(page).to have_content "Destroy All Software"
    expect(page).to have_content "Google Search Engine"
  end
end