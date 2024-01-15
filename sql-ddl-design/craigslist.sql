-- - The region of the craigslist post (San Francisco, Atlanta, Seattle, etc)
-- - Users and preferred region
-- - Posts: contains title, text, the user who has posted, the location of the posting, the region of the posting
-- - Categories that each post belongs to


CREATE DATABASE craigslist;

\c medical_center

-- - A medical center employs several doctors
CREATE TABLE regions
(
  id SERIAL PRIMARY KEY,
  region TEXT NOT NULL,
);

CREATE TABLE users
(
  id SERIAL PRIMARY KEY,
  username TEXT NOT NULL,
  region INTEGER REFERENCES regions ON DELETE NULL,
);

CREATE TABLE posts
(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  post TEXT NOT NULL,
  user INTEGER REFERENCES users ON DELETE NULL,
  location_post,
  region INTEGER REFERENCES regions ON DELETE NULL,
);

