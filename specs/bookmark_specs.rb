require('minitest/autorun')
require('minitest/rg')
require_relative('../models/bookmark.rb')


class TestBookmark < MiniTest::Test 

  def setup
    params = {
      "url" => "google.com",
      "title" => "google",
      "genre" => "search engine",
      "details" => "A search engine"
    }  

    @bookmark = Bookmark.new(params)

  end
  
  def test_url
    assert_equal("www.google.com", @bookmark.url)
  end
  
  def test_title
    assert_equal("Google", @bookmark.title)
  end

  def test_genre
    assert_equal("Search engine", @bookmark.genre)
  end




end