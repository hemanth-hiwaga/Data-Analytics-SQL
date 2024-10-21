 
 
/*
	4. Store-wise Rental Insights and Top Rented Film (Last Year)
Problem:
Get insights into rental performance for each store, including total rentals, revenue, and the most rented film for each store.
*/

SELECT 
    s.store_id,
    COUNT(r.rental_id) AS rentals_made,
    (
        SELECT f.title
        FROM sakila.film f
        JOIN sakila.inventory i2 ON i2.film_id = f.film_id
        JOIN sakila.rental r2 ON r2.inventory_id = i2.inventory_id
        WHERE i2.store_id = s.store_id
        GROUP BY f.title
        ORDER BY COUNT(r2.rental_id) DESC
        LIMIT 1
    ) AS most_rented_film,
    SUM(p.amount) AS revenue
FROM sakila.store s
JOIN sakila.inventory i ON i.store_id = s.store_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY s.store_id
ORDER BY revenue DESC
LIMIT 5;



/*
Providing a store-wise breakdown of rental performance, including the most rented film, gives valuable operational insights.
*/