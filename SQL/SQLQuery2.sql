SELECT TOP 5 * 
FROM dbo.netflix_titles;

SELECT COUNT(*) AS NumberofRows
FROM dbo.netflix_titles

SELECT COUNT(*) AS Numberofcolumns
from sys.columns
WHERE object_id =
OBJECT_ID('dbo.netflix_titles')

SELECT 
    c.name AS ColumnName,
    t.name AS DataType 
FROM sys.columns c
JOIN sys.types t
ON C.user_type_id = t.user_type_id
WHERE c.object_id =
OBJECT_ID('dbo.netflix_titles');

Numerical features
date
smallint

Categorical features
nvarchar
varchar

Possible uniques identifiers (Primary Key)
show_id is the best unique identifier

SELECT
    SUM(CASE WHEN director IS NULL THEN 1 ELSE 0 END) AS Missingdirector,
    SUM(CASE WHEN cast IS NULL THEN 1 ELSE 0 END) AS MissingCast,
    SUM(CASE WHEN country IS NULL THEN 1 ELSE 0 END) AS MissingCountry,
    SUM(CASE WHEN date_added IS NULL THEN 1 ELSE 0 END) AS MissingDateAdded,
    SUM(CASE WHEN rating IS NULL THEN 1 ELSE 0 END) AS MissingRating,
    SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS MissingDuration,
    SUM(CASE WHEN show_ID IS NULL THEN 1 ELSE 0 END) AS MissingShowID,
    SUM(CASE WHEN Type IS NULL THEN 1 ELSE 0 END) AS MissingType,
    SUM(CASE WHEN Title IS NULL THEN 1 ELSE 0 END) AS MissingTitle,
    SUM(CASE WHEN Release_year IS NULL THEN 1 ELSE 0 END) AS MissingRelease_year,
    SUM(CASE WHEN listed_in IS NULL THEN 1 ELSE 0 END) AS MissingListed_in,
    SUM(CASE WHEN description IS NULL THEN 1 ELSE 0 END) AS MissingDescription
FROM netflix_titles;

UPDATE netflix_titles
SET cast = 'Unknown'
WHERE cast IS NULL;

UPDATE netflix_titles
SET country = 'Unknown'
WHERE country IS NULL;

SELECT
       Show_ID,
       COUNT(*) AS DuplicateCount
FROM netflix_titles
GROUP BY Show_ID
HAVING COUNT(*) > 1;

SELECT DISTINCT type 
FROM netflix_titles;

SELECT DISTINCT rating 
FROM netflix_titles
ORDER BY rating;

SELECT *
FROM netflix_titles
WHERE rating LIKE '%min%';

UPDATE netflix_titles
SET duration = rating,
    rating = 'Unknown'
WHERE rating LIKE '%min%';

SELECT *
FROM netflix_titles
WHERE rating LIKE '%min%';

SELECT DISTINCT country 
FROM netflix_titles
ORDER BY country;

SELECT *
FROM netflix_titles
WHERE Country LIKE ',%';

UPDATE netflix_titles
SET country = LTRIM(SUBSTRING(COUNTRY,2, LEN(COUNTRY)))
WHERE country LIKE ',%';

SELECT TOP 20 date_added 
FROM netflix_Titles

UPDATE netflix_titles
SET Country = UPPER(TRIM(country));

UPDATE netflix_titles
SET director = UPPER(TRIM(director));

UPDATE netflix_titles
SET Cast = UPPER(TRIM(cast));

UPDATE netflix_titles
SET listed_in = UPPER(TRIM(listed_in));

UPDATE netflix_titles
SET type = UPPER(TRIM(type));

EXEC sp_help netflix_titles;

SELECT *
FROM netflix_titles
WHERE title IS NULL;

SELECT DISTINCT type 
FROM netflix_titles;

SELECT MIN (release_year),
MAX (release_year)
FROM netflix_titles;

SELECT DISTINCT duration 
FROM netflix_titles
ORDER BY duration;

SELECT *
FROM netflix_titles
WHERE title = ' '
   OR director = ' '
   OR country = ' '
   OR cast = ' '
   OR listed_in = ' ';

   SELECT type,
   COUNT(*) AS Total
   FROM netflix_titles
   GROUP BY type;

   SELECT YEAR(date_added) AS YearAdded,
   COUNT (*) AS TotalContent 
   FROM netflix_titles
   WHERE date_added IS NOT NULL
   GROUP BY YEAR(date_added)
   ORDER BY YearAdded;

    SELECT TOP 10 Country,
    COUNT(*) AS TotalTitles
    FROM netflix_titles
    GROUP BY country 
    ORDER BY TotalTitles DESC;

    SELECT rating, 
    COUNT(*) AS Total 
    FROM netflix_titles
    GROUP BY rating
    ORDER BY Total DESC;

    SELECT TOP 10 listed_in,
    COUNT(*) AS Total 
    FROM netflix_titles
    GROUP BY listed_in
    ORDER BY Total DESC;

SELECT *
FROM netflix_titles;

UPDATE netflix_titles
SET Title = UPPER(TRIM(type));

UPDATE netflix_titles
SET listed_in = REPLACE(listed_in,'Kid''s','KID''S')
WHERE listed_in LIKE 'Kid''s%';