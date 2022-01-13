require 'bookmarks'
require 'database_helpers'

describe Bookmark do
  describe '#all' do
    it 'shows all the bookmarks' do
      # adding the test data
      bookmark = Bookmark.create(url: 'http://www.makersacademy.com', title: 'Makers Academy')
      Bookmark.create(url: 'http://www.google.com', title: 'Google')

      bookmarks = Bookmark.all 
      expect(bookmarks.length).to eq 2
      expect(bookmarks.first).to be_a Bookmark
      expect(bookmarks.first.id).to eq bookmark.id
      expect(bookmarks.first.title).to eq 'Makers Academy'
      expect(bookmarks.first.url).to eq 'http://www.makersacademy.com'
    end
  end

  describe '#self.create' do
    let(:url) { "http://www.bbc.co.uk" }
    let(:title) { "BBC Homepage" }

    it 'adds a new bookmark nto the database' do
      # adds new url and title to database
      bookmark = Bookmark.create(url: url, title: title)
      # persisted_data = PG.connect(dbname: 'bookmark_manager_test').query ("SELECT * FROM bookmarks WHERE id = #{bookmark.id};")
      persisted_data = persisted_data(id: bookmark.id)

      expect(bookmark).to be_a Bookmark
      expect(bookmark.id).to eq persisted_data['id']
      expect(bookmark.title).to eq "BBC Homepage"
      expect(bookmark.url).to eq "http://www.bbc.co.uk"

    end
  end

end
