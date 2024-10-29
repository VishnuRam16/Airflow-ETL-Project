SELECT * FROM Books;

SELECT * FROM Books 
ORDER BY PRICE DESC;

-- Remove trailing . from price column
UPDATE Books 
SET price = TRIM(TRAILING '.' FROM price) 
WHERE price LIKE '%.';

SELECT price FROM Books WHERE price !~ '^\d+$';

-- Change it to type integer
ALTER TABLE Books 
ALTER COLUMN price 
SET DATA TYPE INTEGER 
USING price::INTEGER;

SELECT * FROM Books;

-- Remove text from ratings column, have only the score
SELECT 
    rating, 
    REGEXP_REPLACE(rating, '(\d+(\.\d+)?) out of \d+ stars', '\1')::NUMERIC AS clean_rating
FROM Books;

UPDATE Books 
SET rating = REGEXP_REPLACE(rating, '(\d+(\.\d+)?) out of \d+ stars', '\1');

-- Change type from text to numeric
ALTER TABLE Books 
ALTER COLUMN rating 
SET DATA TYPE NUMERIC 
USING rating::NUMERIC;

SELECT * FROM Books;