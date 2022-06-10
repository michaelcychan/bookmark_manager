# ./spec/features/adding_and_viewing_spec.rb

feature 'Adding and viewing comments' do
  scenario 'a user can add and then view a comment' do
    bookmark = Bookmarks.create(url: "http://www.google.com", title: "Google")

    visit('/bookmarks')
    
    first('.bookmark').click_button 'Add comment'
    expect(current_path).to eq "/bookmarks/#{bookmark.id}/comments/new"
    fill_in('comment', with: 'A search engine')
    click_button "Submit"

    expect(current_path).to eq '/bookmarks'
    save_and_open_page
    expect(first('.bookmark')).to have_content("A search engine")
  end
end
