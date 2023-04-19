DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR(50) NOT NULL UNIQUE,
  email VARCHAR(200) NOT NULL UNIQUE,
  password_digest VARCHAR(60) NOT NULL
);

INSERT INTO users (username, email, password_digest) VALUES
  ('alice', 'alice@gmail.com', 'password_hash_for_alice'),
  ('bob', 'bob@gmail.com', 'password_hash_for_bob'),
  ('charlie', 'charlie@gmail.com','password_hash_for_charlie'),
  ('JSmith', 'jsmith@hotmail.co.uk','password1234');