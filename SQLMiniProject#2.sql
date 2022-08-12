-------------------------
-- SQL Mini Project #2 --
-------------------------


----------------------------------------------------------------------------------------------------
-- Create Insurance tables
-- -- Please follow the sample tables to create a table with appropriate columns and data types.
-- -- Identify primary and foreign keys in each table and establish relationship between them
-- -- Bonus - ER diagram in power point
----------------------------------------------------------------------------------------------------
-- Populate Insurance tables with sample data which you created in above step
-- -- Insert script for each table
-- -- Populate each table with sample data (provided)
-- -- Feel free to add more sample data wherever applicable
----------------------------------------------------------------------------------------------------


CREATE TABLE insurance_product (
insurance_product_id serial PRIMARY KEY,
insurance_title VARCHAR(255) NOT NULL,
price INT,
created_at TIMESTAMP,
tags VARCHAR(255) NOT NULL
);


INSERT INTO insurance_product (insurance_product_id, insurance_title, price, created_at, tags) 
VALUES
(201, 'MetLife', 500, '2011-03-16 10:03:00-04', 'MetLife is a reputable insurance company that has an A+ (Superior) rating from AM Best.'),
(202, 'State Farm', 550, '2020-05-12 16:04:00-02', 'State Farm® protecting what matters most for 100 years with surprisingly great rates for life.'),
(203, 'Allstate Insurance', 450, '2020-10-28 13:46:00-08', 'You are In Good Hands With Allstate.'),
(204, 'Progressive', 700, '2016-04-30 12:34:00-02', 'Find 24/7 progressive support and progressive insurance for you, your family, and your belongings.'),
(205, 'GEICO', 380, '2018-01-03 09:18:00-01', 'Get insurance from a company has been trusted since 1936.');


CREATE TABLE purchase_insurance (
purchase_insurance_id serial PRIMARY KEY,
insurance_product_id INT, 
price INT,
quantity INT,
status VARCHAR(255) NOT NULL
);


INSERT INTO purchase_insurance (insurance_product_id, price, quantity, status) 
VALUES
(201, 500, 2, 'pending'),
(201, 500, 1, 'expired'),
(203, 450, 3, 'covered'),
(204, 700, 1, 'covered'),
(205, 308, 2, 'covered'),
(202, 380, 2, 'covered'),
(202, 700, 4, 'covered'),
(202, 550, 1, 'covered'),
(203, 450, 3, 'covered'),
(201, 550, 5, 'covered'),
(204, 500, 1, 'covered'),
(202, 550, 5, 'covered'),
(205, 500, 3, 'covered'),
(201, 450, 5, 'covered'),
(203, 550, 2, 'expired'),
(203, 700, 4, 'expired'),
(204, 500, 4, 'expired'),
(203, 500, 2, 'expired'),
(205, 550, 4, 'expired'),
(205, 700, 4, 'pending'),
(202, 550, 5, 'pending'),
(202, 380, 1, 'pending'),
(202, 500, 2, 'pending'),
(202, 500, 3, 'pending'),
(201, 700, 3, 'pending');


CREATE TABLE purchase_insurance_history (
purchase_insurance_id serial PRIMARY KEY,
created_at TIMESTAMP,
name VARCHAR(255) NOT NULL,
address VARCHAR(255) NOT NULL,
state VARCHAR(255) NOT NULL,
zipcode INT,
user_id INT
);


INSERT INTO purchase_insurance_history (created_at, name, address, state, zipcode, user_id) 
VALUES
( '2009-07-19 01:08:00-04', 'Tate Cuevas', '7929 Homestead Street', 'NY', 97820, 14),
( '2010-08-10 00:48:00-04', 'Zara Odom', '559 Elm Ave', 'CA', 66051, 17),
( '2009-03-19 02:49:00-04', 'Norah Bauer', '9969 Rockwell St.', 'VA', 10505, 4),
( '2009-10-09 04:44:00-04', 'Fernanda Mcfarland', '24 NW. Woodsman Court', 'GA', 20168, 13),
( '2009-09-04 20:55:00-04', 'Lindsey Paul', '967 South Tailwater Drive', 'TN', 46208, 3),
( '2010-09-26 03:00:00-04', 'Darnell Chandler', '9933 Gulf Ave.', 'NC', 4197, 8),
( '2009-02-22 09:46:00-05', 'Carson Bryan', '8917 Manor Rd.', 'IL', 51664, 2),
( '2010-01-12 11:27:00-05', 'Dayana Suarez', '8155 Bayport St.', 'IA', 45701, 12),
( '2010-06-11 12:21:00-04', 'Solomon Combs', '382 Summer Avenue', 'CT', 50571, 7),
( '2010-08-16 16:09:00-04', 'Thaddeus Finley', '7845 Arnold Street', 'IL', 76863, 19),
( '2010-06-05 20:27:00-04', 'Lacey Booth', '51 Beacon Rd.', 'NY', 89152, 11),
( '2009-06-06 15:13:00-04', 'Jessie Burke', '243 Rock Maple Rd.', 'IL', 62266, 1),
( '2009-08-19 21:34:00-04', 'Serenity Yates', '45 Garden Lane', 'MI', 12682, 10),
( '2009-08-20 04:45:00-04', 'Lamont Morrison', '37 East Edgemont Drive', 'FL', 87597, 9),
( '2009-11-21 00:28:00-05', 'Abby Jackson', '190 Newbridge Drive', 'WI', 25835, 15),
( '2010-06-30 07:30:00-04', 'Javon Hubbard', '1 Railroad Court', 'MI', 69269, 18),
( '2009-08-21 12:06:00-04', 'Royce Ramirez', '7754 Broad St.', 'NY', 32513, 6),
( '2009-07-21 10:20:00-04', 'Maximillian Moss', '8181 Westport St.', 'CA', 65701, 5),
( '2009-08-03 09:54:00-04', 'Reese Banks', '2 Cooper Drive', 'TN', 97210, 16),
( '2009-03-25 15:17:00-04', 'Diana Townsend', '26 Atlantic Road', 'AZ', 72229, 20);


CREATE TABLE users (
user_id serial PRIMARY KEY,
email VARCHAR(255) NOT NULL,
password VARCHAR(255) NOT NULL,
created_at TIMESTAMP
);


INSERT INTO users (email, password, created_at)
VALUES
( 'Earlean.Bonacci@verizon.com', '029761dd44fec0b14825843ad0dfface', '2009-12-20 14:36:00-05' ),
( 'Evelyn.Patnode@gmail.com', 'd678656644a3f44023f90e4f1cace1f4', '2010-11-12 15:27:00-05' ),
( 'Derek.Crenshaw@gmail.com', '5ab7bc159c6371c65b41059097ff0efe', '2009-03-07 21:06:00-05' ),
( 'Shari.Julian@verizon.com', '9d38df22b71c8896137d363e29814e5f', '2010-11-20 04:58:00-05' ),
( 'Zita.Breeding@gmail.com', '7a1c8d1d180d75da38efbd03f388472d', '2009-08-11 17:33:00-04' ),
( 'Samatha.Hedgpeth@verizon.com', 'e129316bf01b0440247414b715726956', '2010-07-18 05:40:00-04' ),
( 'Quinton.Gilpatrick@verizon.com', '7c63f3c25ee52041c2b9aec3c21a96b6', '2010-09-02 16:56:00-04' ),
( 'Vivian.Westmoreland@verizon.com', '100945c1684d6926dcafcacd967aedd9', '2009-10-01 06:34:00-04' ),
( 'Danny.Crays@gmail.com', '511e3229996147ae68f83bab75b9733e', '2009-04-22 02:30:00-04' ),
( 'Edmund.Roles@verizon.com', 'aeac2309a2b01e19177564126a6f8393', '2009-07-07 16:01:00-04' ),
( 'Shanell.Lichtenstein@verizon.com', '98ac14b2c6b7bef8a55b5654aee5f28b', '2009-05-21 19:18:00-04' ),
( 'Romaine.Birdsell@verizon.com', '4571853f5ee73e305ac152c765ad2915', '2009-01-13 23:07:00-05' ),
( 'Zita.Luman@verizon.com', '7467fa8332bc45a15ad2c7003c963ea2', '2009-02-04 08:49:00-05' ),
( 'Claud.Cousineau@gmail.com', '82bcc0c4c3fc1a9bbae75dc7b8fabccc', '2009-08-17 13:48:00-04' ),
( 'Kali.Damore@verizon.com', '66327b7500c1b4a115910260418fd582', '2010-07-07 05:28:00-04' ),
( 'Graciela.Kubala@verizon.com', '85dbdc9fff08c157d7d10555009ef8ff', '2010-08-19 00:42:00-04' ),
( 'Theresia.Edwin@verizon.com', '87b2ae03da521142fd37676e6a3c376a', '2010-08-11 03:21:00-04' ),
( 'Ozella.Yoshimura@gmail.com', 'df68a6070ac1f18ce7a16baa96922948', '2010-07-23 11:03:00-04' ),
( 'Wynona.Greening@verizon.com', '176c818bc66324925ff6c274667e3e8f', '2009-05-24 09:25:00-04' ),
( 'Kimi.Mcqueeney@gmail.com', '588169a56191c0f99b08e7a392e03ada', '2010-06-22 10:16:00-04' );



----------------------------------------------------------------------------------------------------
-- Form any 5 SQL to extract information from tables, use:
-- -- Join
-- -- Where
-- -- Other conditional operators
----------------------------------------------------------------------------------------------------

 
----------------------------------------------------------------------------------------------------
-- 1. Find all the users' name and emails who made at least one purchase from the state of NY.
----------------------------------------------------------------------------------------------------

SELECT name, email 
FROM users AS u 
JOIN purchase_insurance_history AS pih 
ON u.user_id = pih.user_id 
WHERE state = 'NY';


----------------------------------------------------------------------------------------------------
-- 2. Categorize each purchase, 
--    If purchase was from ‘CA’, ‘OR’, or ‘WA), 
----     mark it as 'West Coast';
--    If purchase was from 'ME', 'NH', 'VT', 'NY', 'MA', 'RI', 'CT', 'NJ', 'PA', 'DE', 'MD', or 'DC', 
----     mark it as 'Northeastern';
--    If purchase was from 'VA', 'NC', 'TN', or 'KY', 
----     mark it as 'Central
--    If purchase was from 'WI', 'MI', 'IN', 'IL', 'OH',  
----     mark it as 'Western Great Lakes';
--    Otherwise, 'Other'.
----------------------------------------------------------------------------------------------------

SELECT purchase_insurance_id, state,
CASE 
  WHEN (state = 'CA' or state = 'OR' or state = 'WA') 
    THEN 'West Coast'
  WHEN (state = 'ME' or state = 'NH' or state = 'VT' or state = 'NY' or state = 'MA' or state = 'RI' or state = 'CT' or state = 'NJ' or state = 'PA' or state = 'DE' or state = 'MD' or state = 'DC') 
    THEN 'Northeastern'
  WHEN (state = 'VA' or state = 'NC' or state = 'TN' or state = 'KY')
    THEN 'Central'
  WHEN (state = 'WI' or state = 'MI' or state = 'IN' or state = 'IL' or state = 'OH')
    THEN 'Western Great Lakes'
  ELSE 'Other'
END 
FROM purchase_insurance_history;


----------------------------------------------------------------------------------------------------
-- 3. Find out how many insurance has been sold for each insurance company
----------------------------------------------------------------------------------------------------

SELECT insurance_title, SUM(quantity)
FROM insurance_product AS ip
LEFT JOIN purchase_insurance AS pi
ON ip.insurance_product_id = pi.insurance_product_id
GROUP BY insurance_title;


----------------------------------------------------------------------------------------------------
-- 4. Find the average purchase amount from each state.
----------------------------------------------------------------------------------------------------

SELECT state, AVG(price * quantity) 
FROM purchase_insurance AS pi
LEFT JOIN purchase_insurance_history AS pih
ON pi.purchase_insurance_id = pih.purchase_insurance_id
WHERE state is not NULL
GROUP BY state;


----------------------------------------------------------------------------------------------------
-- 5. Find the most recent purchase made by each user.
----------------------------------------------------------------------------------------------------

SELECT name, MAX(pih.created_at)
FROM purchase_insurance_history AS pih 
JOIN users AS u
ON pih.user_id = u.user_id
GROUP BY name;



