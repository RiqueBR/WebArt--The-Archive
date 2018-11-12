DROP TABLE IF EXISTS exhibitions;
DROP TABLE IF EXISTS artists;


CREATE TABLE artists (
  id SERIAL8 primary key,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  artist_info TEXT,
  artist_img TEXT
);


CREATE TABLE exhibitions (
  id SERIAL8 primary key,
  name VARCHAR(255),
  category VARCHAR(255),
  artist_id INT8 REFERENCES artists(id) ON DELETE CASCADE,
  exhibition_info TEXT,
  exhibit_img TEXT
);
