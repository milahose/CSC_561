--LAB1A

CREATE TABLE users (
	id SERIAL PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(255) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE status (
	id SERIAL PRIMARY KEY,
	description VARCHAR(500),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE inventory (
	id SERIAL PRIMARY KEY,
  status_id INTEGER REFERENCES status(id),
  description VARCHAR(500),
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE transactions (
	id SERIAL PRIMARY KEY,
  user_id INTEGER REFERENCES users(id),
  inventory_id INTEGER REFERENCES inventory(id),
  checkout_time TIMESTAMP NOT NULL,
  scheduled_checkin_time TIMESTAMP,
  actual_checkin_time TIMESTAMP,
	created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO users (first_name, last_name, email, password) 
VALUES
  ('Bob', 'Jones', 'bob@test.com', 'NzTD%*!XYXah'),
  ('Sally', 'White', 'sally@test.com', 'ge%iXvh^@4J$'),
  ('Test', 'User', 'test@test.com', 'BZE&2Irz0V8w'),
  ('John', 'Doe', 'john@test.com', 'BMxWMPytK^q8'),
  ('Jane', 'Doe', 'jane@test.com', '&Wlhi#lBChSV');

INSERT INTO status(description)
VALUES
  ('Available'), 
  ('Checked out'), 
  ('Overdue'),
  ('Unavailable'),
  ('Under Repair');

INSERT INTO inventory (status_id, description) 
VALUES
  (1, 'Laptop1'),
  (2, 'Laptop2'),
  (3, 'Webcam1'),
  (4, 'TV1'),
  (5, 'Microphone1');

INSERT INTO transactions (
  user_id,
  inventory_id,
  checkout_time,
  scheduled_checkin_time,
  actual_checkin_time
) 
VALUES
  (1, 1, '2021-06-08 08:00:00', '2021-06-12 08:00:00', '2021-06-12 08:00:00'),
  (1, 4, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (3, 2, '2021-08-08 04:00:00', '2021-06-24 08:00:00', '2021-06-24 08:00:00');

UPDATE inventory SET status_id = 2 WHERE id IN (1, 2, 4);

ALTER TABLE users ADD COLUMN signed_agreement BOOLEAN DEFAUlT false;

SELECT i.description, t.scheduled_checkin_time
FROM inventory AS i
INNER JOIN transactions AS t
ON i.id = t.inventory_id
ORDER BY scheduled_checkin_time DESC;

SELECT i.description, t.scheduled_checkin_time
FROM inventory AS i
INNER JOIN transactions AS t
ON i.id = t.inventory_id
WHERE t.scheduled_checkin_time > '2019-05-31';

SELECT COUNT(*)
FROM inventory AS i
INNER JOIN transactions AS t
ON i.id = t.inventory_id
WHERE i.status_id = 2
AND t.user_id = 1;

--LAB1B

INSERT INTO transactions (
  user_id,
  inventory_id,
  checkout_time,
  scheduled_checkin_time,
  actual_checkin_time
) 
VALUES
  (1, 2, '2021-06-08 08:00:00', '2021-08-25 03:00:00', '2021-08-26 03:42:39'),
  (2, 3, '2021-07-08 10:00:00', '2021-07-16 11:00:00', '2021-07-18 11:22:55'),
  (3, 4, '2021-07-08 10:00:00', '2021-09-28 10:00:00', '2021-09-28 12:15:32'),
  (4, 5, '2021-07-08 10:00:00', '2018-08-01 14:39:53', '2018-08-02 14:39:53'),
  (1, 1, '2021-08-22 17:11:59', '2021-08-13 19:57:10', '2021-07-30 01:18:23'),
  (2, 2, '2021-09-22 16:10:04', '2021-08-03 21:44:34', '2021-08-13 06:17:21'),
  (3, 3, '2021-09-01 07:47:16', '2021-07-21 09:14:33', '2021-08-22 06:34:22'),
  (4, 4, '2021-09-16 00:28:05', '2021-09-01 21:09:51', '2021-09-09 03:38:01'),
  (1, 5, '2021-08-03 13:11:12', '2021-08-01 11:59:02', '2021-07-16 11:41:42'),
  (2, 1, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (3, 2, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (4, 3, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (1, 4, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (2, 5, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (3, 1, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (4, 2, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (1, 3, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (2, 4, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (3, 5, '2021-07-08 10:00:00', '2021-06-16 08:00:00', '2021-06-16 08:00:00'),
  (1, 2, '2017-02-12 04:00:00', '2017-02-15 08:00:00', '2017-02-15 08:00:00'),
  (3, 4, '2018-07-08 10:00:00', '2018-07-18 08:00:00', '2018-07-18 08:00:00'),
  (4, 1, '2021-08-08 04:00:00', '2021-06-24 08:00:00', '2021-06-24 08:00:00');

CREATE VIEW late_checkins AS
SELECT 
  user_id,
  inventory_id,
  late_checkins,
  description
FROM (
  SELECT DISTINCT
    t.user_id,
    COUNT(i.description) AS late_checkins,
    t.inventory_id,
    i.description
  FROM inventory AS i
  INNER JOIN transactions AS t
  ON i.id = t.inventory_id
  WHERE t.scheduled_checkin_time < t.actual_checkin_time
  GROUP BY t.user_id, t.inventory_id, i.description
) AS late_checkins
ORDER BY user_id, inventory_id, description;

SELECT * FROM late_checkins;