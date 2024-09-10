select*from pizzahut.pizza_types;


SELECT 
    pizzahut.pizza_types.name, pizzahut.pizzas.price
FROM
    pizzahut.pizza_types
        JOIN
    pizzahut.pizzas ON pizza_types.pizza_type_id = pizzas.pizza_type_id
ORDER BY pizzahut.pizzas.price DESC
LIMIT 1;