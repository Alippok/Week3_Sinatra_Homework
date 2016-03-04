CREATE TABLE bookmarks(
  id SERIAL8 PRIMARY KEY,
  url VARCHAR(255),
  genre VARCHAR(255),
  title VARCHAR(255),
  details VARCHAR(255)
)