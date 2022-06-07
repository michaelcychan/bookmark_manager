# in spec/features/bookmarks_viewing_spec.rb

feature 'Viewing bookmarks' do
  scenario 'A user can see all bookmarks' do
    visit('/bookmarks')
    expect(page).to have_content "http://www.makersacademy.com"
    expect(page).to have_content "http://www.destroyallsoftware.com"
    expect(page).to have_content "http://www.google.com"
  end
end