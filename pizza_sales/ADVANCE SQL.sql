SELECT 
    pizza_types.category,
    ROUND(SUM(order_details.quantity * pizzas.price) / (SELECT 
                    ROUND(SUM(pizzahut.order_details.quantity * pizzahut.pizzas.price),
                                2) AS Total_sales
                FROM
                    pizzahut.order_details
                        JOIN
                    pizzahut.pizzas ON pizzas.pizza_id = order_details.pizza_id) * 100,
            2) AS REVENUE
FROM
    pizzahut.pizza_types
        JOIN
    pizzahut.pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
        JOIN
    pizzahut.order_details ON order_detailS.pizza_id = pizzas.pizza_id
GROUP BY pizza_types.category
ORDER BY REVENUE DESC
LIMIT 3;

select order_date,
sum(revenue) over(order by order_date) as cummulative_revenue
from
(select orders.order_date,
sum(order_details.quantity*pizzas.price) as revenue
from pizzahut.order_details join pizzahut.pizzas on
pizzas.pizza_id=order_details.pizza_id join
pizzahut.orders on
orders.order_id=order_details.order_id
group by orders.order_date) as sales;



select name ,revenue from
(select category,name,revenue,
rank() over(partition by category order by revenue desc) as rn
from
(select pizza_types.category,pizza_types.name,
sum(order_details.quantity*pizzas.price) as revenue
from pizzahut.pizza_types join pizzahut.pizzas on
pizza_types.pizza_type_id=pizzas.pizza_type_id
join pizzahut.order_details on
order_details.pizza_id=pizzas.pizza_id
group by pizza_types.category,pizza_types.name) as a) as b
where rn<=3;
