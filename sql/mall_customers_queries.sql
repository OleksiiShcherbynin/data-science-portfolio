-- Aggregation, window functions and multi-key sorting on the "Mall Customers" table (PostgreSQL).
-- 200 customers: gender, age, annual income and a spending score from 1 to 100.

-- 1. Customer count and share by gender.
--    SUM(COUNT(*)) OVER () computes the grand total over the grouped result,
--    so each group's percentage is calculated in a single query without a subquery.
SELECT
    "Genre" AS gender,
    COUNT(*) AS visitors,
    ROUND(100.0 * COUNT(*) / SUM(COUNT(*)) OVER (), 2) AS share_pct
FROM mall_customers
GROUP BY "Genre";

-- 2. Male customers sorted by several keys in different directions:
--    youngest first, then highest income, then lowest spending score
SELECT *
FROM mall_customers
WHERE "Genre" = 'Male'
ORDER BY
    "Age" ASC,
    "Annual Income (k$)" DESC,
    "Spending Score (1-100)" ASC;
