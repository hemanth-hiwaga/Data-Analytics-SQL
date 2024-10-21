 
/*
	5. Customer Rental and Revenue Insights (Last Year)
Problem:
Identify the total rentals and revenue generated by active and inactive customers over the last year.

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
	Segmenting customer activity helps us understand which group contributes more to rentals and revenue. This query compares active vs. inactive customer performance.
*/