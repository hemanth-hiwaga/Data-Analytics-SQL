 
 
/*
	8. Top 5 Actors by Rental Revenue
Problem:
Identify the top 5 actors whose films generated the highest rental revenue, along with the number of rentals they contributed to.
*/


SELECT 
    CONCAT(a.first_name, ' ', a.last_name) AS fullname,
    COUNT(r.rental_id) AS times_rented,
    SUM(p.amount) AS revenue
FROM sakila.actor a 
JOIN sakila.film_actor fa ON fa.actor_id = a.actor_id
JOIN sakila.film f ON f.film_id = fa.film_id
JOIN sakila.inventory i ON i.film_id = f.film_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY a.actor_id, a.first_name, a.last_name
ORDER BY revenue DESC
LIMIT 5;



/*
	Identifying the most profitable actors helps in determining star power in films. Here are the top 5 actors based on rental revenue
*/
