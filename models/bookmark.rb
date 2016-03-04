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

  def title
    return @title.capitalize
  end

  def genre
    return @genre.capitalize
  end

  def details
    return @details.capitalize
  end

  def save
    sql = "INSERT INTO bookmarks(
    url,
    title,
    genre,
    details)
    VALUES(
    '#{@url}',
    '#{@title}',
    '#{@genre}',
    '#{@details}')
    "
    Bookmark.run_sql(sql)
  end

  def self.all
    sql = "SELECT * from bookmarks"
    result = Bookmark.run_sql(sql)
    bookmarks = result.map{|bookmark| Bookmark.new(bookmark)}
    return bookmarks
  end



  private

  def self.run_sql(sql)
    begin
      db = PG.connect({ dbname: "bookmark_app", host: "localhost"})
      result = db.exec(sql)
      return result
    ensure
      db.close
    end
  end


end 