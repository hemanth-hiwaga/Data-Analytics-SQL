 
/*
    18. Language-Based Film Rental Performance
Problem:
Analyze how films in different languages perform in terms of rentals, revenue, and average rental duration.
*/

SELECT 
    l.name AS language,
    COUNT(r.rental_id) AS films_rented,
    SUM(p.amount) AS revenue,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_duration
FROM sakila.language l
JOIN sakila.film f ON f.language_id = l.language_id
JOIN sakila.inventory i ON i.film_id = f.film_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY l.language_id
ORDER BY revenue DESC
LIMIT 5;


/*
Language diversity plays a significant role in film rentals. This analysis breaks down the rental performance by language, including revenue and rental duration.
*/