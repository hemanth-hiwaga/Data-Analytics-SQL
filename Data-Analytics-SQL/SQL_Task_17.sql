 /*17. Rental Activity by Film Rating
Problem:
Understand the rental activity and revenue based on film ratings, helping to identify which ratings generate more interest.*/


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



/* Does film rating affect rentals and revenue? This report delves into rental activity based on film ratings, providing insight into audience preferences. */