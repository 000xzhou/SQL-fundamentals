
CREATE DATABASE craigslist;

\c medical_center

-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region TEXT NOT NULL,
);

-- - Users and preferred region
CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  region INTEGER REFERENCES regions ON DELETE NULL,
);

-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post TEXT NOT NULL,
  user INTEGER REFERENCES users ON DELETE NULL,
  location_post,
  region INTEGER REFERENCES regions ON DELETE NULL,
  categorie INTEGER REFERENCES categories ON DELETE NULL,
);


-- - Categories that each post belongs to ????
CREATE TABLE categories
(
  id SERIAL PRIMARY KEY,
  categorie TEXT NOT NULL,
);