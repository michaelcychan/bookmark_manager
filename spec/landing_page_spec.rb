# ./spec/landing_page_spec.rb

feature 'Landing page' do
  scenario 'Open first page successfully' do
    visit('/')
    expect(page).to have_content "Hello World!"
  end
end