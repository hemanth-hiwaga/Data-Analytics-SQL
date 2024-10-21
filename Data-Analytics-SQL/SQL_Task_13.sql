/*
    13. Customer Activity Status and Revenue Contribution

    Problem:
Determine how active and inactive customers contribute to the total revenue and rental activity.
*/

SELECT 
    cm.active,
    COUNT(DISTINCT cm.customer_id) AS status,
    COUNT(r.rental_id) AS total_rentals_by_customers,
    SUM(p.amount) AS revenue_from_customers
FROM sakila.customer cm
JOIN sakila.rental r ON r.customer_id = cm.customer_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY cm.active
ORDER BY cm.active DESC;


/*
    Active customers tend to generate more rentals and revenue. This report compares the activity status of customers and their contribution to business growth
*/
