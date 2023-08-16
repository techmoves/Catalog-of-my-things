CREATE TABLE books (
  id INTEGER PRIMARY KEY,
  title VARCHAR(255),
  author VARCHAR(255),
  cover_state VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
);

CREATE TABLE labels (
  id INTEGER PRIMARY KEY,
  name VARCHAR(255),
  created_at TIMESTAMP,
  updated_at TIMESTAMP
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
);
