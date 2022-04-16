-- Builds starting tables

CREATE TABLE review_id_table (
  review_id TEXT PRIMARY KEY NOT NULL,
  customer_id INTEGER,
  product_id TEXT,
  product_parent INTEGER,
  review_date DATE -- this should be in the formate yyyy-mm-dd
);

-- This table will contain only unique values
CREATE TABLE products_table (
  product_id TEXT PRIMARY KEY NOT NULL UNIQUE,
  product_title TEXT
);

-- Customer table for first data set
CREATE TABLE customers_table (
  customer_id INT PRIMARY KEY NOT NULL UNIQUE,
  customer_count INT
);

-- Vine table
CREATE TABLE vine_table (
  review_id TEXT PRIMARY KEY,
  star_rating INTEGER,
  helpful_votes INTEGER,
  total_votes INTEGER,
  vine TEXT,
  verified_purchase TEXT
);

-- Check tables
SELECT * FROM customers_table;
SELECT * FROM products_table;
SELECT * FROM review_id_table;
SELECT * FROM vine_table;

---Extra queries to further look into vine reviews
-- 1785886 total rows in vine table
SELECT COUNT(vine) FROM vine_table;

-- 4290 total vine reviews
SELECT COUNT(vine)
FROM vine_table
WHERE vine = 'Y';

-- 4268 with vine but did not have verified purchase
SELECT COUNT(vine)
FROM vine_table
WHERE vine = 'Y' and verified_purchase = 'N';

-- 22 with vine and did have verified purchase
SELECT COUNT(vine)
FROM vine_table
WHERE vine = 'Y' and verified_purchase = 'Y';

-- 4.07 avgerage star rating with vine
SELECT AVG(star_rating)
FROM vine_table
WHERE vine = 'Y';

-- Table of vine reviews with their dates
SELECT vt.review_id,
	vt.star_rating,
	vt.vine,
	rt.review_date
--INTO vine_date_table
FROM vine_table as vt
	INNER JOIN review_id_table as rt
		on vt.review_id = rt.review_id
	WHERE vt.vine = 'Y';

-- Show earliest(2007) and latest(2015) dates under a vine review
SELECT MIN(review_date),
	MAX(review_date)
FROM vine_date_table;

-- List of vine customers and their reviews with votes and counts
SELECT vt.star_rating,
	vt.helpful_votes,
	vt.total_votes,
	vt.verified_purchase,
	rt.review_id,
	ct.customer_id,
	ct.customer_count
--INTO vine_customers
FROM vine_table as vt
	INNER JOIN review_id_table as rt
		on vt.review_id = rt.review_id
	INNER JOIN customers_table as ct
		on rt.customer_id = ct.customer_id
	WHERE vt.vine = 'Y';
