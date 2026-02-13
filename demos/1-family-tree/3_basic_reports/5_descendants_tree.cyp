// Show all multi-generational descendants of the root ancestors (Tim Cruz & Amy Harolds)
MATCH (root:Person {first_name: 'Timothy', last_name: 'Cruz'})
MATCH path = (root)<-[:CHILD_OF|SPOUSE_OF*]-(descendant:Person)
WHERE (descendant)-[:CHILD_OF]->() // Ensure we are looking at children relationships down the tree
RETURN descendant.first_name, descendant.last_name, length(path) as generation_depth
ORDER BY generation_depth;
