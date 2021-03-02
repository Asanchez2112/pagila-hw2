/*
 * A group of social scientists is studying American movie watching habits.
 * To help them, select the titles of all films that have never been rented by someone who lives in the United States.
 *
 * NOTE:
 * Not every film in the film table is available in the store's inventory,
 * and you should only return films in the inventory.
 *
 * HINT:
 * This can be solved either with a LEFT JOIN or with the NOT IN operator.
 * You may choose whichever solution makes the most sense to you.
 */


SELECT title
FROM film
INNER JOIN inventory USING (film_id)
WHERE title NOT IN (SELECT title
                    FROM film
                    LEFT JOIN inventory USING (film_id)
                    LEFT JOIN rental USING(inventory_id)
                    LEFT JOIN customer USING(customer_id)
                    LEFT JOIN address USING(address_id)
                    LEFT JOIN city USING(city_id)
                    LEFT JOIN country USING(country_id)
                    WHERE inventory_id IS NOT NULL AND country='United States'
                    GROUP BY title
                    ORDER BY title)
GROUP BY title
ORDER BY title;
