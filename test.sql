-------------------------------------------------------------------
-- WARM UPS: Type the following commands to build muscle memory. --
-------------------------------------------------------------------
-- 1. [Union Join]: SELECT email, id FROM users
--                  UNION
--                  SELECT title, price FROM products;

SELECT email, user_id FROM users
UNION
SELECT title, price FROM products;


-- 2. [Conditional]: SELECT title,
--                     CASE WHEN (price < 100)
--                     THEN 'cheap'
--                     ELSE 'expensive'
--                   END FROM products;

SELECT title,
CASE WHEN (price < 100)
THEN 'cheap'
ELSE 'expensive'
END FROM products;

--------------------------------------------------------
-- EXERCISES: Answer using the techniques from above. --
--------------------------------------------------------
-- 0. Select all the names associated with purchases made after 2010-01-01,
--       and all the emails associated with users made after 2010-01-01.

SELECT name, email
FROM purchases AS p
JOIN users AS u
ON p.user_id = u.user_id
WHERE p.created_at > '2010-01-01 00:00:00-00' AND u.created_at > '2010-01-01 00:00:00-00';

-- 1. Write a conditional that will categorize each purchase as 'West Coast' (if it
--    was ordered from CA, OR, or WA) or 'Other'

SELECT state,
CASE WHEN (state = 'CA' or state = 'OR' or state = 'WA')
THEN 'West Coast'
ELSE 'Other'
END FROM purchases
ORDER BY state;

-- 2. Modify the last query with a group by statement, 
--    to find the number of purchases among West Coast states vs Others.

SELECT COUNT(purchase_id),
CASE WHEN (state = 'CA' or state = 'OR' or state = 'WA')
THEN 'West Coast'
ELSE 'Other'
END AS result FROM purchases
GROUP BY result;


-- 3. Write a conditional to divide users into three groups, based on their created_at:
--    early for before 2009-06-01,
--    majority for between 2009-06-01 and 2010-01-01
--    late for after 2010-01-01


SELECT user_id,
CASE WHEN (created_at < '2009-06-01 00:00:00-00')
THEN 'early'
WHEN (created_at > '2009-06-01 00:00:00-00' AND created_at < '2010-01-01 00:00:00-00')
THEN 'majority'
ELSE 'late'
END FROM users;


-- 4. Modify the last query by adding a join against the purchases table.
--    Note: Since created_at exists in both tables, you'll need to prefix with the table name (e.g users.created_at)

SELECT u.user_id,
CASE WHEN (u.created_at < '2009-06-01 00:00:00-00')
THEN 'early'
WHEN (u.created_at > '2009-06-01 00:00:00-00' AND u.created_at < '2010-01-01 00:00:00-00')
THEN 'majority'
ELSE 'late'
END FROM users AS u
JOIN purchases AS p
ON u.user_id = p.user_id;



-- 5. Add a groupby statement to find which group of customers makes
--    more purchases: early, majority, or late.

SELECT COUNT(u.user_id), 
CASE WHEN (u.created_at < '2009-06-01 00:00:00-00')
THEN 'early'
WHEN (u.created_at > '2009-06-01 00:00:00-00' AND u.created_at < '2010-01-01 00:00:00-00')
THEN 'majority'
ELSE 'late'
END AS result FROM users AS u
JOIN purchases AS p
ON u.user_id = p.user_id
GROUP BY result;

----------------------------------------
-- EXTRA CREDIT: If you finish early. --
----------------------------------------
-- 1. Use DATEPART() and a conditional to categorize purchases as
--    'weekday' and 'weekend'.
--    Hint: DATEPART(DW, column) outputs day of week as a number
--    with Sunday as 0, Saturday as 6.

SELECT CASE
	WHEN DATE_PART('dow', created_at) IN (0, 6) THEN 'weekend'
	ELSE 'weekday'
	END AS day_type
FROM purchases;


-- 2. Group by state and weekday/weekend to see the number of weekday
--    weekend purchases per state.

SELECT state,
    CASE WHEN DATE_PART('dow', created_at) IN (0, 6) THEN 'weekend'
	ELSE 'weekday'
	END AS day_type,
	COUNT(*)
FROM purchases
GROUP BY state, CASE WHEN DATE_PART('dow', created_at) IN (0, 6) THEN 'weekend'
	ELSE 'weekday'
	END;