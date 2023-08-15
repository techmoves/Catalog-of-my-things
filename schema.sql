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