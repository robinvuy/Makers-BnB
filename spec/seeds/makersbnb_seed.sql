TRUNCATE TABLE spaces RESTART IDENTITY;

INSERT INTO spaces (name, description, price, user_id)
VALUES
  ('space1', 'description1', 100, 1),
  ('space2', 'description2', 200, 2);

