-- Filtering and sorting on the "World Data 2023" table (PostgreSQL).
-- One row per country, 35 columns of demographic, economic and health indicators.

-- 1. Size of the armed forces in a single country
SELECT "Country", "Armed Forces size"
FROM "world-data-2023"
WHERE "Country" = 'Qatar';

-- 2. Countries below the population replacement level (fertility rate < 2), lowest first
SELECT "Country", "Fertility Rate"
FROM "world-data-2023"
WHERE "Fertility Rate" < 2
ORDER BY "Fertility Rate";

-- 3. Pattern matching combined with a numeric condition:
--    country code starting with S, or life expectancy below 60
SELECT "Country", "Abbreviation", "Life expectancy"
FROM "world-data-2023"
WHERE "Abbreviation" LIKE 'S%'
   OR "Life expectancy" < 60;

-- 4. Countries with English as the official language
SELECT "Country", "Official language"
FROM "world-data-2023"
WHERE "Official language" = 'English';

-- 5. English-speaking countries at either end of the health spectrum:
--    very low maternal mortality, or low life expectancy (parentheses keep OR inside the AND)
SELECT "Country", "Official language", "Maternal mortality ratio", "Life expectancy"
FROM "world-data-2023"
WHERE "Official language" = 'English'
  AND ("Maternal mortality ratio" < 20 OR "Life expectancy" < 60);
