# ./spec/features/against_sql_injection_spec.rb

feature 'Protecting against SQL Injection' do
  scenario 'Turns SQL injection into a text' do
    visit('/bookmarks-new')
    fill_in('title', with: 'Apple (UK)')
    fill_in('url', with: "');DROP TABLE bookmarks; --")
    click_button "Add Bookmark"
    expect(page).to have_link('Apple (UK)', href: "');DROP TABLE bookmarks; --")
  end
end