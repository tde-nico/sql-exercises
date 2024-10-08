CREATE TABLE bands (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
  id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  release_year INT,
  band_id INT NOT NULL,
  FOREIGN KEY (band_id) REFERENCES bands(id)
);