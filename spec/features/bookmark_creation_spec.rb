# in spec/features/bookmarks_creation_spec.rb

feature 'Creating bookmarks' do
  scenario 'A user can create new bookmarks' do
    visit('/bookmarks-new')
    fill_in('url', with: 'https://www.apple.com/uk/')
    fill_in('title', with: 'The Apple(UK) website')
    click_button "Add Bookmark"
    expect(page).to have_link('The Apple(UK) website', href: 'https://www.apple.com/uk/')
  end

  scenario 'A wrong URL is rejected' do
    visit('/bookmarks-new')
    fill_in('url', with: 'Not/a/valid/url')
    fill_in('title', with: 'The Apple(UK) website')
    click_button "Add Bookmark"
    expect(page).not_to have_link('The Apple(UK) website', href: 'Not/a/valid/url')
    expect(page).to have_content('Please enter a valid URL')
  end
end