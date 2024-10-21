 
/*
20. Customer Activity: Active vs. Inactive
Problem:
Examine the contribution of active and inactive customers in terms of rentals and revenue.
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
Active customers are vital for business sustainability. This report compares the performance of active and inactive customers in terms of rentals and revenue.
*/