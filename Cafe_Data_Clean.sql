-- View dataset
SELECT *
FROM dirty_cafe_sales;

-- Create a copy
CREATE TABLE cafe_sales_clean
LIKE dirty_cafe_sales;

-- Copy data to the new copy
INSERT cafe_sales_clean
SELECT *
FROM dirty_cafe_sales;

-- Check for duplicates using transaction_id as the column contains unique IDs
SELECT DISTINCT transaction_id, COUNT(*)
FROM cafe_sales_clean
GROUP BY transaction_id
HAVING COUNT(*) > 1;
-- Result: No duplicates

-- Add new columns with proper data types
ALTER TABLE cafe_sales_clean
	ADD COLUMN quantity_num INT,
    ADD COLUMN price_per_unit_num DECIMAL(10,2),
    ADD COLUMN total_spent_num DECIMAL(10,2);
    
-- Populate with cleaned values
UPDATE cafe_sales_clean
SET
	quantity_num = NULLIF(quantity, ''),
    price_per_unit_num = NULLIF(price_per_unit, ''),
    total_spent_num = CASE
						WHEN Total_Spent REGEXP '^[0-9]+(\\.[0-9]+)?$'
							THEN CAST(total_spent AS DECIMAL(10,2))
						ELSE NULL
					END;

-- Delete original columns
ALTER TABLE cafe_sales_clean
	DROP COLUMN quantity,
    DROP COLUMN price_per_unit,
    DROP COLUMN total_spent;

-- Update total_spent_num column to remove Null values
UPDATE cafe_sales_clean
SET total_spent_num = quantity_num * price_per_unit_num
WHERE total_spent_num IS NULL;

-- Filter item column that has UNKNOWN, ERROR or Blank values
-- SELECT *
-- FROM cafe_sales_clean
-- WHERE item = ''
-- OR item = 'UNKNOWN'
-- OR item = 'ERROR';

-- Update item, payment_method, location columns that have UNKNOWN, ERROR or Blank values to NULL
UPDATE cafe_sales_clean
SET 
	item = NULL,
	payment_method = NULL
WHERE item IN ('', 'UNKNOWN', 'ERROR')
	OR payment_method IN ('', 'UNKNOWN', 'ERROR');

-- Original data overwritten with NULL, copy over original values
UPDATE cafe_sales_clean AS m
JOIN dirty_cafe_sales AS o
	ON m.transaction_id = o.transaction_id
SET
	m.item = o.item,
	m.location = o.location,
	m.payment_method = o.payment_method;

-- Update item, payment_method, location, transaction_date columns that have UNKNOWN, ERROR or Blank values to NULL again
UPDATE cafe_sales_clean
SET
	item = CASE
				WHEN TRIM(UPPER(item)) IN ('', 'UNKNOWN', 'ERROR') THEN NULL
				ELSE item
			END,
	payment_method = CASE
				WHEN TRIM(UPPER(payment_method)) IN ('', 'UNKNOWN', 'ERROR') THEN NULL
				ELSE payment_method
			END,
	location = CASE
				WHEN TRIM(UPPER(location)) IN ('', 'UNKNOWN', 'ERROR') THEN NULL
				ELSE location
			END;

UPDATE cafe_sales_clean
SET
	transaction_date = CASE
				WHEN TRIM(UPPER(transaction_date)) IN ('', 'UNKNOWN', 'ERROR') THEN NULL
				ELSE transaction_date
			END;



-- Join tables to obtain NULL item values
SELECT *
FROM cafe_sales_clean as blankitems
INNER JOIN dirty_cafe_sales_item as cafeitems
	ON blankitems.price_per_unit_num = cafeitems.price;

-- Update NULL item values from the joint table
UPDATE cafe_sales_clean AS b
JOIN dirty_cafe_sales_item AS c
	ON b.price_per_unit_num = c.price
SET b.item = c.ï»¿Item
WHERE b.item IS NULL;
-- Assumption: Since both Cake and Juice are priced at $3, and Sandwich and Smoothie are both priced at $4, the item names for missing records were inferred based on the joined dataset.

-- Calculate the percentage of the payment methods listed
SELECT
	payment_method,
	COUNT(*) AS method_count,
	ROUND(
		COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_total
FROM cafe_sales_clean
GROUP BY payment_method
ORDER BY percentage_of_total DESC;

-- Assign one of the three available payment methods to NULL values, randomly and equally
WITH methods AS (
    SELECT 
        ROW_NUMBER() OVER () AS rn,
        payment_method
    FROM (
        SELECT DISTINCT payment_method
        FROM cafe_sales_clean
        WHERE payment_method IS NOT NULL
    ) m
),
null_rows AS (
    SELECT 
        transaction_id,
        ROW_NUMBER() OVER (ORDER BY RAND()) AS rn
    FROM cafe_sales_clean
    WHERE payment_method IS NULL
)
UPDATE cafe_sales_clean t
JOIN null_rows n 
  ON t.transaction_id = n.transaction_id
JOIN methods m 
  ON ((n.rn - 1) % (SELECT COUNT(*) FROM methods)) + 1 = m.rn
SET t.payment_method = m.payment_method;

-- Calculate the percentage of the locations available
SELECT
	location,
	COUNT(*) AS method_count,
	ROUND(
		COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage_of_location
FROM cafe_sales_clean
GROUP BY location
ORDER BY percentage_of_location DESC;

-- Assign one of the two available locations to NULL values, randomly and equally
WITH locations AS (
    SELECT 
        ROW_NUMBER() OVER () AS rn,
        location
    FROM (
        SELECT DISTINCT location
        FROM cafe_sales_clean
        WHERE location IS NOT NULL
    ) x
),
null_rows AS (
    SELECT 
        transaction_id,
        ROW_NUMBER() OVER (ORDER BY RAND()) AS rn
    FROM cafe_sales_clean
    WHERE location IS NULL
)
UPDATE cafe_sales_clean t
JOIN null_rows n 
  ON t.transaction_id = n.transaction_id
JOIN locations l 
  ON ((n.rn - 1) % (SELECT COUNT(*) FROM locations)) + 1 = l.rn
SET t.location = l.location;

-- Show all rows still containing NULL values
SELECT *
FROM cafe_sales_clean
WHERE
	item IS NULL
	OR payment_method IS NULL
	OR location IS NULL
	OR transaction_date IS NULL
	OR quantity_num IS NULL
	OR price_per_unit_num IS NULL
	OR total_spent_num IS NULL;
-- Result: Only transaction_date column has NULL values. Hence, I have decided to remove these rows.

-- Delete only rows where transaction_date is NULL
DELETE 
from cafe_sales_clean
WHERE transaction_date IS NULL;