 
-- 15. Film Length and Rental Revenue Correlation
-- Problem:
-- Examine how the length of films impacts their rental revenue and average rental duration.


SELECT 
    f.length AS film_length,
    SUM(p.amount) AS revenue_made,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS average_rental_duration
FROM sakila.film f
JOIN sakila.inventory i ON i.film_id = f.film_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY f.length
ORDER BY revenue_made DESC;


-- Does the length of a film affect its rental performance? This report explores the relationship between film length, rental revenue, and duration.