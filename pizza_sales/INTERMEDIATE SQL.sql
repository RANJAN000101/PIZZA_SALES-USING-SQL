SELECT 
    pizzahut.pizza_types.category,
    SUM(pizzahut.order_details.quantity) AS Quantity
FROM
    pizzahut.pizza_types
        JOIN
    pizzahut.pizzas ON pizzas.pizza_type_id = pizza_types.pizza_type_id
        JOIN
    pizzahut.order_details ON order_details.pizza_id = pizzas.pizza_id
GROUP BY pizzahut.pizza_types.category
ORDER BY Quantity DESC;


select*from pizzahut.orders;
select hour(order_time) as Hour,count(order_date) as Order_count
from pizzahut.orders
group by hour(order_time)
order by count(order_date);

SELECT 
    category, COUNT(name)
FROM
    pizzahut.pizza_types
GROUP BY category;

select round( avg(quantity),2) as AVGPIZZA from
(SELECT 
    orders.order_date, sum(order_details.quantity) as quantity
FROM
    pizzahut.orders
        JOIN
    pizzahut.order_details ON order_details.order_id = orders.order_id
GROUP BY orders.order_date) as order_quantity;

SELECT pizza_types.name,
SUM(order_details.quantity*pizzas.price) AS REVENUE
FROM pizzahut.pizza_types join
pizzahut.pizzas ON pizza_types.pizza_type_id=pizzas.pizza_type_id
JOIN pizzahut.order_details ON
order_detailS.pizza_id=pizzas.pizza_id
group by pizza_types.name
order by REVENUE
DESC LIMIT 3;
