select*from pizzahut.order_details;

SELECT 
    pizzahut.pizzas.size,
    COUNT(pizzahut.order_details.order_details_id) AS order_count
FROM
    pizzahut.pizzas
        JOIN
    pizzahut.order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzahut.pizzas.size
ORDER BY order_count DESC;