 
/*
	7. Revenue by Country and Customer Insights
Problem:
Determine which countries generate the highest revenue and customer activity by showing the number of customers, total rentals, and revenue generated.
*/


SELECT 
    cn.country,
    COUNT(cm.customer_id) AS total_customers,
    COUNT(r.rental_id) AS rentals_made,
    SUM(p.amount) AS revenue
FROM sakila.country cn
JOIN sakila.city ct ON ct.country_id = cn.country_id
JOIN sakila.address ad ON ad.city_id = ct.city_id
JOIN sakila.customer cm ON cm.address_id = ad.address_id
JOIN sakila.rental r ON r.customer_id = cm.customer_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY cn.country_id, cn.country
ORDER BY revenue DESC
LIMIT 10;



/*
Knowing which countries contribute the most to rentals and revenue can help businesses focus their expansion strategies. This query offers a country-wise breakdown of customer activity and revenue.
*/
 
