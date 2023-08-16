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

CREATE TABLE music_albums (
  id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  published_date DATE,
  on_spotify BOOLEAN,
  archived BOOLEAN
);

CREATE TABLE genres (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL
);
