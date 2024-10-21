 
/*
	6. Average Rental Duration and Total Rentals by Store (Last Year)
Problem:
Analyze the rental performance of each store by calculating the average rental duration and total rentals made in the last year.
*/


SELECT 
    s.store_id,
    AVG(DATEDIFF(r.return_date, r.rental_date)) AS average_duration,
    COUNT(r.rental_id) AS total_rentals
FROM sakila.store s
JOIN sakila.inventory i ON i.store_id = s.store_id
JOIN sakila.rental r ON r.inventory_id = i.inventory_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
WHERE r.rental_date >= DATE_SUB(CURDATE(), INTERVAL 1 YEAR)
GROUP BY s.store_id
ORDER BY average_duration DESC;


/*
	By understanding the average rental duration per store, businesses can better manage inventory and customer expectations. This report provides insights into store performance over the last year
*/
