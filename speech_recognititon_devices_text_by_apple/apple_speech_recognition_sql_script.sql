 ** Question
-- You have recently joined Apple speech recognition team and 
-- have been assigned a task to evaluate the consistency across 
-- different voice-enabled device types in rendering text responses. 
-- There are five distinct tables named table1, table2, table3, table4, and table5.

-- Each of these tables contains the following columns:

-- Column Name	Description
-- device_type,	Type of the device (Siri, Alexa, etc.)
-- device_id,	Unique identifier of the specific device
-- feature,	Main feature of the device being used
-- text,	Text processed by the device

-- Your objective is to write a SQL query that identifies texts 
-- that are rendered by at least three different device types.

-- For instance, if Siri, Alexa, and Google Assistant all render the text "Hi, how is your day?" 
-- in response to a particular speech input, that text should be included in your result.

-- Example Output:
-- text
-- I am doing great, thanks!
-- It's sunny today
-- The result of this will be 10


-- DDL: Create Tables
CREATE TABLE table1 (
    device_type VARCHAR(50),
    device_id INT,
    feature VARCHAR(100),
    text TEXT
);

CREATE TABLE table2 (
    device_type VARCHAR(50),
    device_id INT,
    feature VARCHAR(100),
    text TEXT
);

CREATE TABLE table3 (
    device_type VARCHAR(50),
    device_id INT,
    feature VARCHAR(100),
    text TEXT
);

CREATE TABLE table4 (
    device_type VARCHAR(50),
    device_id INT,
    feature VARCHAR(100),
    text TEXT
);

CREATE TABLE table5 (
    device_type VARCHAR(50),
    device_id INT,
    feature VARCHAR(100),
    text TEXT
);

-- DML: Insert Data

-- table1
INSERT INTO table1 VALUES
('Siri', 101, 'Voice Response', 'Hi, how is your day?'),
('Siri', 102, 'Voice Response', 'What’s the weather like?'),
('Siri', 103, 'Voice Response', 'Setting an alarm for 7 AM tomorrow.'),
('Siri', 104, 'Voice Response', 'Open the Maps app.'),
('Siri', 105, 'Voice Response', 'Playing your favorite playlist.'),
('Siri', 106, 'Voice Response', 'The nearest coffee shop is 2 miles away.'),
('Siri', 107, 'Voice Response', 'Today’s weather is sunny and warm.'),
('Siri', 109, 'Voice Response', 'Setting a timer for 10 minutes.'),
('Siri', 119, 'Voice Response', 'Setting a timer for 10 minutes.');

-- table2
INSERT INTO table2 VALUES
('Google Assistant', 201, 'Voice Response', 'Hi, how is your day?'),
('Google Assistant', 202, 'Voice Response', 'Play some music.'),
('Google Assistant', 203, 'Voice Response', 'The weather is sunny.'),
('Google Assistant', 204, 'Voice Response', 'Sending the email.'),
('Google Assistant', 205, 'Voice Response', 'Turning on the living room lights.'),
('Google Assistant', 206, 'Voice Response', 'Your next appointment is at 3 PM.'),
('Google Assistant', 207, 'Voice Response', 'Today’s weather is sunny and warm.');

-- table3
INSERT INTO table3 VALUES
('Amazon Alexa', 301, 'Voice Response', 'Hi, how is your day?'),
('Amazon Alexa', 302, 'Voice Response', 'Turn off the lights.'),
('Amazon Alexa', 303, 'Voice Response', 'Setting an alarm for 7 AM tomorrow.'),
('Amazon Alexa', 304, 'Voice Response', 'Locking the front door.'),
('Amazon Alexa', 305, 'Voice Response', 'The current temperature is 72 degrees.'),
('Amazon Alexa', 306, 'Voice Response', 'Adding milk to your shopping list.'),
('Amazon Alexa', 307, 'Voice Response', 'Today’s weather is sunny and warm.'),
('Amazon Alexa', 309, 'Voice Response', 'Setting a timer for 10 minutes.');

-- table4
INSERT INTO table4 VALUES
('Bixby', 401, 'Voice Response', 'What’s the weather like?'),
('Bixby', 402, 'Voice Response', 'Send a message to John.'),
('Bixby', 403, 'Voice Response', 'The weather is rainy.'),
('Bixby', 404, 'Voice Response', 'The movie starts at 7 PM.'),
('Bixby', 405, 'Voice Response', 'Calculating the fastest route home.'),
('Bixby', 406, 'Voice Response', 'Your flight is on time.'),
('Bixby', 407, 'Voice Response', 'Today’s weather is sunny and warm.');

-- table5
INSERT INTO table5 VALUES
('Cortana', 501, 'Voice Response', 'Set an alarm for 7 AM tomorrow.'),
('Cortana', 502, 'Voice Response', 'Open the calendar.'),
('Cortana', 503, 'Voice Response', 'Playing your playlist.'),
('Cortana', 504, 'Voice Response', 'The stock market is up today.'),
('Cortana', 505, 'Voice Response', 'You have 5 unread emails.'),
('Cortana', 506, 'Voice Response', 'I found 3 recipes for pasta.'),
('Cortana', 507, 'Voice Response', 'Today’s weather is sunny and warm.'),
('Cortana', 509, 'Voice Response', 'Setting a timer for 10 minutes.');

select * from table1;
select * from table2;
select * from table3;
select * from table4;
select * from table5;

--- Query 

SELECT text
FROM (
    SELECT device_type, text FROM table1
    UNION ALL
    SELECT device_type, text FROM table2
    UNION ALL
    SELECT device_type, text FROM table3
    UNION ALL
    SELECT device_type, text FROM table4
    UNION ALL
    SELECT device_type, text FROM table5
) AS all_devices
GROUP BY text
HAVING COUNT(DISTINCT device_type) >= 3;

