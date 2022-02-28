-- schema.sql
-- Since we might run the import many times we'll drop if exists
DROP DATABASE IF EXISTS sl_pg;

CREATE DATABASE sl_pg;

-- Make sure we're using our `sl_pg` database
\c sl_pg;

-- We can create our user table
CREATE TABLE IF NOT EXISTS user (
  id SERIAL PRIMARY KEY,
  username VARCHAR,
  email VARCHAR
);

-- We can create our post table
CREATE TABLE IF NOT EXISTS post (
  id SERIAL PRIMARY KEY,
  userId INTEGER REFERENCES user(id),
  title VARCHAR,
  content TEXT,
  image VARCHAR,
  date DATE DEFAULT CURRENT_DATE
);
