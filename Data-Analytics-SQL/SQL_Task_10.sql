 
 
/*
	10. Rental Performance by Film Rating (Last Year)
Problem:
Evaluate how films with different ratings performed in terms of rentals and revenue in the last year.
*/


SELECT 
    f.rating,
    COUNT(r.rental_id) AS rentals,
    SUM(p.amount) AS revenue
FROM sakila.film f
JOIN sakila.inventory i ON i.film_id = f.film_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY f.rating
ORDER BY revenue DESC;



/*
	Understanding how different film ratings perform in the market can help businesses cater to audience preferences. Here's a breakdown of rental revenue by film rating over the last year.
*/
