require('pg')

class Bookmark
  attr_reader(:id, :url, :title, :genre, :details)
  def initialize(params)
    @id = nil || params["id"].to_i
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

  def self.find(id)
    sql = "SELECT * from bookmarks WHERE id='#{id}'"
    result = Bookmark.run_sql(sql)
    bookmarks = result.map{|bookmark| Bookmark.new(bookmark)}
    return bookmarks[0]
  end

  def self.update(params)
    sql = "UPDATE bookmarks SET
    url='#{params['url']}',
    title='#{params['title']}',
    genre='#{params['genre']}',
    details='#{params['details']}'
    WHERE id='#{params['id']}'"
    
    Bookmark.run_sql(sql)
  end
  
  def self.delete(id)
    sql = "DELETE FROM bookmarks where id= #{id}"
    Bookmark.run_sql(sql)
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