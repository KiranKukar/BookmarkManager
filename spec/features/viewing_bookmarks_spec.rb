feature 'Viewing bookmarks' do

  scenario 'visiting the index page' do
    visit('/')
    expect(page).to have_content "Welcome to Bookmark Manager"
  end

  scenario 'see bookmarks on the page' do
    # adding the test data
    Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
    Bookmark.create(url: 'http://www.google.com', title: 'Google')


    visit('/bookmarks')

    expect(page).to have_link('Makers Academy', href: "http://www.makersacademy.com")
    expect(page).to have_link('Google', href: "http://www.google.com")
  end
end