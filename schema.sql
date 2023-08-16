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
