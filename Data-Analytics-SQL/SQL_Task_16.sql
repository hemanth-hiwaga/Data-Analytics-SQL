 
/*
16. Top 5 Staff by Rentals Handled and Revenue Generated
Problem:
Identify which staff members handled the most rentals and generated the highest revenue in the last year.
*/

SELECT 
    CONCAT(sf.first_name, ' ', sf.last_name) AS fullname,
    COUNT(r.rental_id) AS rentals_handled,
    SUM(p.amount) AS revenue,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS avg_rental_duration
FROM sakila.staff sf 
JOIN sakila.rental r ON r.staff_id = sf.staff_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY sf.staff_id, sf.first_name, sf.last_name
ORDER BY revenue DESC
LIMIT 10;


/*Staff efficiency directly impacts business success. This analysis showcases the top 5 staff members based on rentals handled and revenue generated in the last year. */