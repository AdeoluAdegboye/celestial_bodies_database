 Universe Database
A relational PostgreSQL database that models the structure of the universe — from galaxies down to moons. This project was built as a hands-on exercise in relational database design, covering schema creation, data types, constraints, and foreign key relationships.

📖 Overview
The Universe Database organizes astronomical data across five related tables, following a clear hierarchical structure:
Galaxy → Star → Planet → Moon
Each level references the one above it through foreign keys, enforcing referential integrity across the entire dataset.

🗂️ Schema
galaxy
Stores information about galaxies in the universe, including their type, age, distance from Earth, and whether they contain a black hole.
star
Represents stars belonging to a galaxy. Each star holds a foreign key reference to its parent galaxy, along with data on luminosity, age, and distance.
planet
Covers planets orbiting a star. Includes flags for whether the planet supports life, its number of moons, and its distance from Earth.
moon
Tracks natural satellites orbiting planets. Captures data on atmosphere presence, radius, and age.
galaxy_types (lookup table)
A reference table that classifies galaxies by type — Spiral, Elliptical, Irregular, Lenticular, and Dwarf — used as a foreign key in the galaxy table.

🔗 Relationships
_Table     | References  | Via Foreign Key_
star       galaxy           galaxy_id
planet     star              star_id
moon       planet           planet_id
galaxy     galaxy_types     galaxy_type_id

 Highlights

Database: PostgreSQL
Primary keys auto-increment using SERIAL on all tables
Data types used: VARCHAR, INT, NUMERIC, TEXT, BOOLEAN
Constraints: NOT NULL and UNIQUE enforced on key columns
All name columns are VARCHAR and required to be unique
Foreign keys follow consistent naming — each FK column shares the name of the column it references



🚀 Getting Started

Make sure PostgreSQL is installed and running.
Clone this repository.
Run the SQL script in your terminal:

bashpsql -U postgres -f universe_database.sql

Connect to the database and explore:

bashpsql -U postgres -d universe
sqlSELECT * FROM galaxy;
SELECT * FROM star WHERE galaxy_id = 1;
SELECT * FROM planet WHERE has_life = TRUE;

💡 Concepts Demonstrated

Relational database design and normalization
Primary and foreign key constraints
One-to-many relationships across multiple tables
Use of lookup/reference tables
PostgreSQL data types and column constraints
Seeding a database with realistic filler data
