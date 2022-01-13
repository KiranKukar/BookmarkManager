feature "adds a bookmark" do
  scenario "user adds a bookmark" do
    visit('/bookmarks')

    fill_in 'url', with: 'www.website.co.uk'
    fill_in 'title', with: 'Website title'
    click_on 'Create'

    expect(page).to have_link('Website title', href: 'www.website.co.uk')
  end
end
