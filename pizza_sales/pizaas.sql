select*from pizzahut.pizzas;
SELECT 
    ROUND(SUM(pizzahut.order_details.quantity * pizzahut.pizzas.price), 2) AS Total_sales
FROM
    pizzahut.order_details
JOIN
    pizzahut.pizzas ON pizzas.pizza_id = order_details.pizza_id;
    
    
  
