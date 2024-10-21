/*
1. Top 5 Customers by Rental Revenue (Last 6 Months)
Problem:
Retrieve the top 5 customers who generated the most revenue in rentals in the last 6 months, including their full name, total rentals, and total revenue.

 */



SELECT 
    CONCAT(cm.first_name, ' ' , cm.last_name ) AS fullname,
    COUNT(r.rental_id) AS total_rentals,
    SUM(p.amount) AS total_revenue,
    DATE_FORMAT(MAX(r.rental_date),'%d-%m-%y') AS last_rented_date
FROM sakila.customer cm
JOIN sakila.rental r ON r.customer_id = cm.customer_id
JOIN sakila.payment p ON p.rental_id = r.rental_id
GROUP BY cm.customer_id, cm.first_name, cm.last_name
ORDER BY total_revenue DESC
LIMIT 5;



/*
	"Identifying high-value customers can help drive targeted marketing strategies. This query lists the top 5 customers by rental revenue in the past 6 months.
*/