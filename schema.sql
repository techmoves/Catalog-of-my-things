CREATE TABLE books (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  published_date DATE,
  cover_state VARCHAR(50),
  archived BOOLEAN
);

CREATE TABLE labels (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE book_labels (
  book_id INTEGER,
  label_id INTEGER,
  PRIMARY KEY (book_id, label_id)
);

CREATE TABLE item (
  id INT SERIAL PRIMARY KEY,
  genre INT REFERENCES genre(id),
  author INT REFERENCES author(id),
  source INT REFERENCES source(id),
  label INT REFERENCES label(id),
  publish_date DATE NOT NULL,
  archived BOOLEAN NOT NULL
);

CREATE TABLE game (
  id INT PRIMARY KEY REFERENCES item(id),
  multiplayer VARCHAR(30) NOT NULL,
  last_played_at DATE NOT NULL
);

CREATE TABLE author (
  id INT PRIMARY KEY REFERENCES item(id),
  first_name VARCHAR(30) NOT NULL,
  last_name VARCHAR(30) NOT NULL

CREATE TABLE music_albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    published_date TIMESTAMP NOT NULL,
    artist VARCHAR(255) NOT NULL,
    on_spotify BOOLEAN NOT NULL
);

CREATE TABLE genres (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    description TEXT NOT NULL
);

CREATE TABLE music_albums_genres (
    music_album_id INT REFERENCES music_albums(id),
    genre_id INT REFERENCES genres(id),
    PRIMARY KEY (music_album_id, genre_id)
);
