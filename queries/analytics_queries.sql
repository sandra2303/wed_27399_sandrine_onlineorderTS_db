WITH ProductRevenue AS (
    -- 1. Calculate total revenue and total quantity sold for each product
    SELECT
        p.PRODUCT_ID,
        p.PRODUCT_NAME,
        p.CATEGORY,
        SUM(oi.QUANTITY) AS TotalQuantitySold,
        SUM(oi.QUANTITY * oi.ITEM_PRICE) AS TotalRevenueGenerated
    FROM
        ORDER_ITEMS oi
    JOIN
        PRODUCTS p ON oi.PRODUCT_ID = p.PRODUCT_ID
    GROUP BY
        p.PRODUCT_ID, p.PRODUCT_NAME, p.CATEGORY
)
SELECT
    RANK() OVER (ORDER BY TotalRevenueGenerated DESC) AS Rank_By_Revenue,
    PRODUCT_NAME,
    CATEGORY,
    TotalRevenueGenerated,
    TotalQuantitySold
FROM
    ProductRevenue
-- Filter for the top 5 results after ranking
WHERE
    RANK() OVER (ORDER BY TotalRevenueGenerated DESC) <= 5
ORDER BY
    Rank_By_Revenue;


SELECT
    c.CITY,
    COUNT(DISTINCT c.CUSTOMER_ID) AS TotalCustomers,
    SUM(o.TOTAL_AMOUNT) AS TotalCityRevenue,
    -- Analytical function to show this city's revenue share compared to the total
    ROUND(RATIO_TO_REPORT(SUM(o.TOTAL_AMOUNT)) OVER () * 100, 2) AS Revenue_Share_Pct
FROM
    CUSTOMERS c
JOIN
    ORDERS o ON c.CUSTOMER_ID = o.CUSTOMER_ID
WHERE
    o.STATUS = 'Delivered'
GROUP BY
    c.CITY
HAVING
    SUM(o.TOTAL_AMOUNT) > 0
ORDER BY
    TotalCityRevenue DESC;