-- Question:
-- You have access to a social media database, containing tables related to user posts, friendships, and likes. 
-- Your goal is to calculate the total number of likes made on posts by friends specifically on Fridays.

-- DDL commands
CREATE TABLE posts (
    post_id INT PRIMARY KEY,
    user_name VARCHAR(50),
    date_posted DATETIME
);
CREATE TABLE friends (
    user_name1 VARCHAR(50),
    user_name2 VARCHAR(50)
);
CREATE TABLE likes (
    user_name VARCHAR(50),
    post_id INT,
    date_liked DATETIME
);

-- DML Commands
INSERT INTO posts (post_id, user_name, date_posted) VALUES
(1, 'Alice', '2024-01-16'),
(2, 'Fiona', '2024-01-18'),
(3, 'Hannah', '2024-01-09'),
(4, 'Eve', '2023-12-27'),
(5, 'Fiona', '2024-01-15'),
(6, 'Julia', '2024-01-09'),
(7, 'Bob', '2024-01-18'),
(8, 'Julia', '2024-01-01'),
(9, 'Charlie', '2024-01-11'),
(10, 'Charlie', '2024-01-18'),
(11, 'David', '2024-01-06'),
(12, 'Ian', '2024-01-02'),
(13, 'David', '2024-01-14'),
(14, 'Eve', '2023-12-25'),
(15, 'George', '2023-12-28'),
(16, 'Charlie', '2024-01-02'),
(17, 'Alice', '2024-01-22'),
(18, 'Bob', '2024-01-15'),
(19, 'Charlie', '2023-12-26'),
(20, 'Eve', '2023-12-25'),
(21, 'George', '2024-01-02'),
(22, 'Julia', '2024-01-06'),
(23, 'Eve', '2024-01-10'),
(24, 'Bob', '2024-01-22'),
(25, 'Hannah', '2024-01-12'),
(26, 'Ian', '2024-01-16'),
(27, 'George', '2024-01-06'),
(28, 'Alice', '2024-01-08'),
(29, 'Fiona', '2023-12-28'),
(30, 'David', '2024-01-17'),
(31, 'Eve', '2024-01-02'),
(32, 'Bob', '2024-01-05'),
(33, 'Bob', '2024-01-03'),
(34, 'Bob', '2024-01-21'),
(35, 'Julia', '2024-01-18'),
(36, 'Hannah', '2024-01-15'),
(37, 'Charlie', '2024-01-23'),
(38, 'George', '2023-12-31'),
(39, 'David', '2024-01-13'),
(40, 'Fiona', '2023-12-27'),
(41, 'Charlie', '2023-12-26'),
(42, 'Hannah', '2023-12-27'),
(43, 'Hannah', '2024-01-19'),
(44, 'Eve', '2024-01-02'),
(45, 'Hannah', '2024-01-03'),
(46, 'Hannah', '2024-01-11'),
(47, 'David', '2024-01-04'),
(48, 'Bob', '2023-12-28'),
(49, 'Ian', '2024-01-10'),
(50, 'Charlie', '2024-01-21');

INSERT INTO friends (user_name1, user_name2) VALUES
('David', 'Fiona'),
('Charlie', 'Hannah'),
('Bob', 'George'),
('George', 'Alice'),
('Eve', 'Ian'),
('Eve', 'Bob'),
('Ian', 'Bob'),
('Charlie', 'George'),
('Julia', 'Alice'),
('Ian', 'Fiona'),
('David', 'Alice'),
('Bob', 'Julia'),
('Ian', 'Eve'),
('George', 'Eve'),
('Eve', 'David'),
('Eve', 'Charlie'),
('Hannah', 'Julia'),
('Fiona', 'Eve'),
('Julia', 'David'),
('Charlie', 'Bob'),
('Bob', 'Hannah'),
('Bob', 'Fiona'),
('George', 'George'),
('George', 'Charlie'),
('Julia', 'Fiona'),
('Hannah', 'George'),
('Ian', 'Charlie'),
('Eve', 'Hannah'),
('Fiona', 'Charlie'),
('Hannah', 'Ian'),
('George', 'Fiona'),
('David', 'Charlie'),
('Hannah', 'David'),
('Hannah', 'Charlie'),
('Ian', 'Hannah'),
('Fiona', 'Fiona'),
('Alice', 'George'),
('Hannah', 'Hannah'),
('Eve', 'George'),
('Charlie', 'David'),
('Alice', 'Hannah'),
('David', 'Julia'),
('Alice', 'Alice');

INSERT INTO likes (user_name, post_id, date_liked) VALUES
('George', 7, '2023-12-31'),
('Alice', 39, '2024-01-13'),
('David', 6, '2024-01-22'),
('Bob', 21, '2024-01-08'),
('Charlie', 21, '2024-01-04'),
('Fiona', 35, '2024-01-01'),
('Alice', 30, '2024-01-22'),
('Charlie', 21, '2024-01-14'),
('David', 17, '2023-12-31'),
('Julia', 2, '2024-01-19'),
('Eve', 34, '2024-01-12'),
('Julia', 3, '2024-01-16'),
('Bob', 13, '2024-01-04'),
('Ian', 24, '2024-01-04'),
('Eve', 6, '2024-01-17'),
('Fiona', 14, '2024-01-14'),
('George', 34, '2023-12-28'),
('Hannah', 23, '2024-01-01'),
('Alice', 13, '2024-01-17'),
('Ian', 13, '2023-12-27'),
('Ian', 17, '2024-01-15'),
('George', 44, '2024-01-14'),
('Julia', 47, '2023-12-26'),
('Hannah', 48, '2024-01-17'),
('Hannah', 20, '2024-01-05'),
('Eve', 20, '2024-01-23'),
('Hannah', 34, '2023-12-30'),
('David', 25, '2023-12-26'),
('Fiona', 17, '2024-01-21'),
('Eve', 31, '2024-01-14'),
('Alice', 23, '2023-12-25'),
('Alice', 46, '2024-01-05'),
('Alice', 16, '2024-01-19'),
('Charlie', 3, '2024-01-15'),
('Fiona', 20, '2024-01-22'),
('Alice', 36, '2024-01-05'),
('Eve', 5, '2024-01-18'),
('Alice', 1, '2024-01-10'),
('Charlie', 30, '2024-01-20'),
('Bob', 32, '2024-01-20'),
('George', 47, '2024-01-03'),
('David', 29, '2024-01-21'),
('Julia', 4, '2024-01-21'),
('George', 27, '2024-01-09'),
('Ian', 32, '2024-01-08'),
('David', 30, '2024-01-23'),
('Hannah', 29, '2024-01-23'),
('David', 8, '2024-01-08'),
('Fiona', 6, '2024-01-23'),
('Julia', 6, '2024-01-12');

-- Query

WITH friday_likes AS (
  SELECT 
    l.user_name AS liker,
    p.user_name AS post_owner,
    l.date_liked,
    l.post_id
  FROM likes l
  JOIN posts p ON l.post_id = p.post_id
  JOIN friends f 
    ON (f.user_name1 = l.user_name AND f.user_name2 = p.user_name)
    OR (f.user_name2 = l.user_name AND f.user_name1 = p.user_name)
  WHERE DAYNAME(l.date_liked) = 'Friday'
)
SELECT 
  date_liked, 
  COUNT(*) AS likes
FROM friday_likes
GROUP BY date_liked
ORDER BY date_liked;



