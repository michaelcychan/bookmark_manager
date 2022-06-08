# in spec/features/bookmarks_creation_spec.rb

feature 'Creating bookmarks' do
  scenario 'A user can create new bookmarks' do
    # # connect to testing DB and insert testing db entries
    # connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/bookmarks/new')
    fill_in('url', with: 'https://www.apple.com/uk/')
    click_button "Add Bookmark"
    expect(page).to have_content "https://www.apple.com/uk/"
  end
end