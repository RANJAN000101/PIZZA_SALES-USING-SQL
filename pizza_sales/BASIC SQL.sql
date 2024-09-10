select count(order_id) as Total_orders from pizzahut.orders;

SELECT 
    ROUND(SUM(pizzahut.order_details.quantity * pizzahut.pizzas.price), 2) AS Total_sales
FROM
    pizzahut.order_details
JOIN
    pizzahut.pizzas ON pizzas.pizza_id = order_details.pizza_id;
    

SELECT 
    pizzahut.pizza_types.name, pizzahut.pizzas.price
FROM
    pizzahut.pizza_types
        JOIN
    pizzahut.pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzahut.pizzas.price DESC
LIMIT 1;

SELECT 
    pizzahut.pizzas.size,
    COUNT(pizzahut.order_details.order_details_id) AS order_count
FROM
    pizzahut.pizzas
        JOIN
    pizzahut.order_details ON pizzas.pizza_id = order_details.pizza_id
GROUP BY pizzahut.pizzas.size
ORDER BY order_count DESC;

SELECT 
    pizzahut.pizza_types.name,
    SUM(pizzahut.order_details.quantity) AS Quantity
FROM
    pizzahut.pizza_types
        JOIN
    pizzahut.pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    pizzahut.order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzahut.pizza_types.name
ORDER BY Quantity DESC
LIMIT 5;