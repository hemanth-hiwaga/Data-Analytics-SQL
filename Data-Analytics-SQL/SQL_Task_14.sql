 
-- 14. Monthly Rental Performance and Most Rented Film
-- Problem:
-- Analyze rental performance month-by-month and identify the most rented film for each month.

SELECT 
    DATE_FORMAT(r.rental_date, '%Y-%m') AS month_year,
    COUNT(r.rental_id) AS rentals_made,
    SUM(p.amount) AS revenue,
    (
        SELECT 
            f.title
        FROM sakila.film f 
        JOIN sakila.inventory i ON i.film_id = f.film_id
        JOIN sakila.rental r2 ON r2.inventory_id = i.inventory_id
        WHERE DATE_FORMAT(r2.rental_date, '%Y-%m') = DATE_FORMAT(r.rental_date, '%Y-%m')
        GROUP BY f.title
        ORDER BY COUNT(r2.rental_id) DESC
        LIMIT 1
    ) AS most_rented_film
FROM sakila.rental r
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY month_year;

-- Tracking monthly performance helps forecast demand trends. This analysis also highlights the most rented film for each month over the past year.