// Find the average life expectancy for this family tree (only considering deceased members)
MATCH (p:Person)
WHERE p.death_date IS NOT NULL
WITH avg(duration.between(p.birth_date, p.death_date).years) AS average_lifespan
RETURN average_lifespan;
