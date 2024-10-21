 
/*
	3. Top 5 Categories by Rental Revenue (Last Year)
Problem:
Analyze the top 5 film categories by revenue earned from rentals, including the total rentals and average rental duration.
*/


SELECT 
    c.name AS category,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_revenue,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_duration
FROM sakila.category c
JOIN sakila.film_category fc ON fc.category_id = c.category_id
JOIN sakila.film f ON f.film_id = fc.film_id
JOIN sakila.inventory i ON i.film_id = f.film_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY c.name
ORDER BY total_revenue DESC
LIMIT 5;


/*
"Understanding which categories drive the most revenue can guide content acquisition strategies. Here's the top 5 categories by revenue earned from rentals
*/