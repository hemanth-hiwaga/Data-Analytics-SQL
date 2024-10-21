 
/*
	2. Top 5 Films by Rental Revenue (Last Year)
Problem:
Find the top 5 films based on revenue earned from rentals in the past year, including the number of times rented and the average rental duration.
*/


SELECT 
    f.title AS film_name,
    SUM(p.amount) AS film_revenue,
    COUNT(r.rental_id) AS times_rented,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS average_rental_duration
FROM sakila.film f 
JOIN sakila.inventory i ON i.film_id = f.film_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY f.film_id, f.title
ORDER BY film_revenue DESC
LIMIT 5;


/*
Caption:
"Data-driven decision-making helps to highlight top-performing products. This query identifies the top 5 films generating the most rental revenue over the past year.
*/