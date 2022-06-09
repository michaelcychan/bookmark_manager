# ./spec/landing_page_spec.rb

feature 'Landing page' do
  scenario 'Opens first page successfully' do
    visit('/')
    expect(page).to have_content 'Bookmark Manager'
  end
end
