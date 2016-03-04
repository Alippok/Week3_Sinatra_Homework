require('pg')

class Bookmark
  attr_reader(:url, :title, :genre, :details)
  def initialize(params)
    @url = params["url"]
    @title = params["title"]
    @genre = params["genre"]
    @details = params["details"]
  end

  def url
    if @url.start_with?("www.")
      return @url
    else
    return "www.".concat(@url)
    end
  end





end 