// Group people by profession/work
MATCH (p:Person)
WHERE p.works IS NOT NULL
RETURN p.works as Profession, collect(p.first_name + ' ' + p.last_name) as People, count(p) as Count
ORDER BY Count DESC;
