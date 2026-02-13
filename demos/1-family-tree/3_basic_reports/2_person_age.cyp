// Calculate the age of each person (alive or dead)
MATCH (p:Person)
WITH p, 
     CASE 
       WHEN p.death_date IS NOT NULL THEN duration.between(p.birth_date, p.death_date).years 
       ELSE duration.between(p.birth_date, date()).years 
     END AS age
RETURN p.first_name, p.last_name, p.birth_date, p.death_date, age
ORDER BY age DESC;
