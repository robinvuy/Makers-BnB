TRUNCATE TABLE users, spaces RESTART IDENTITY;

INSERT INTO users (username, name, email, password)
VALUES
  ('username1', 'name1', 'username1@example.com', 'password1'),
  ('username2', 'name2', 'username2@example.com', 'password2');

INSERT INTO spaces (name, description, price, user_id)
VALUES
  ('space1', 'description1', 100, 1),
  ('space2', 'description2', 200, 2);

