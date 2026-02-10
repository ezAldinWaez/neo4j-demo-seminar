# AGENTS.md

This file provides guidance to agents when working with code in this repository.

## Project Overview

This is a Neo4j demo project for a seminar containing a sample family tree dataset. The project provides Cypher scripts to set up and populate a Neo4j graph database with a multi-generational family structure.

## File Structure

- `demos/1-family-tree/load_family_tree.cyp` - Main Cypher script that:
  - Creates unique constraints for `Person` and `Family` nodes
  - Defines 27 Person nodes across 4 generations with properties: `id`, `first_name`, `last_name`, `sex`, `birth_date`, `death_date` (optional), `education`, `works`
  - Creates 8 Family nodes representing marriage units with: `id`, `marriage_date`, `status` (ACTIVE/WIDOWED/DIVORCED), and optional `divorce_date`
  - Establishes relationships: `SPOUSE_OF` (with role: HUSBAND/WIFE) and `CHILD_OF` between people and families

## Development Environment

Python 3.14 virtual environment with installed Neo4j libraries:
- `neo4j` (6.0.3) - Official Neo4j Python driver
- `neomodel` (6.0.1) - ORM for Neo4j
- `py2neo` (2021.2.4) - Pythonic interface to Neo4j

Activate the venv with: `source .venv/bin/activate`

## Running the Demo

1. **Set up Neo4j locally**: Install and start a Neo4j database (version 5.x or 6.x recommended)
   - Via Docker: `docker run -d -p 7474:7474 -p 7687:7687 -e NEO4J_AUTH=neo4j/password neo4j:latest`
   - Download from https://neo4j.com/download/

2. **Load the family tree data**: Execute the Cypher script in Neo4j
   - Using Neo4j Browser: Copy content of `load_family_tree.cyp` and paste into the browser query editor, then execute
   - Using `neo4j` Python driver:
     ```python
     from neo4j import GraphDatabase
     with open('demos/1-family-tree/load_family_tree.cyp') as f:
         script = f.read()
     driver = GraphDatabase.driver("bolt://localhost:7687", auth=("neo4j", "password"))
     with driver.session() as session:
         session.execute_write(lambda tx: tx.run(script))
     driver.close()
     ```

3. **Query the data**: Example queries to explore relationships:
   - Find all people: `MATCH (p:Person) RETURN p`
   - Find family members: `MATCH (p:Person)-[:CHILD_OF]->(f:Family),(p2:Person)-[:SPOUSE_OF]->(f) RETURN p, p2, f`
   - Find a person's descendants: `MATCH (p:Person {first_name: 'Alexander'})<-[:CHILD_OF*]-(d:Person) RETURN d`

## Key Concepts

- **Person nodes**: Represent individual family members with biographical and professional details
- **Family nodes**: Represent marriage units/families that connect parents to children
- **SPOUSE_OF relationships**: Link married couples to their family unit (with role metadata)
- **CHILD_OF relationships**: Link children to their family units, enabling parent-child traversal
- Constraints ensure unique person and family IDs, maintaining data integrity

## Notes

- The Cypher script uses `IF NOT EXISTS` for idempotent constraint creation
- File extension is `.cyp` (Cypher script)
- All dates use ISO format (`YYYY-MM-DD`)
- The dataset includes realistic biographical data across professions and education levels
