 
/*
19. Actor-Based Rental Performance
Problem:
Determine which actors contributed the most to rental activity and revenue.
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
Which actors boost film rentals the most? This analysis ranks the top actors whose movies were rented frequently and brought in significant revenue.
*/