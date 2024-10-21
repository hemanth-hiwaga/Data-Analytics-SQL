/*
	9. Staff Rental Performance and Revenue (Last Year)
Problem:
Analyze the performance of staff in handling rentals, including total rentals, revenue generated, and the average rental duration for the last year.
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



/*
	Staff performance plays a critical role in customer satisfaction. This query provides insights into staff members who generated the most revenue and handled the most rentals.
*/