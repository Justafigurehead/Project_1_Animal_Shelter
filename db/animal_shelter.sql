DROP TABLE animals;
DROP TABLE owners;
DROP TABLE adoptions;

CREATE TABLE animals (
id SERIAL4 PRIMARY KEY, 
animal_name VARCHAR(255), 
adoption_status VARCHAR(255),
admission_date DATE,
species VARCHAR(255),
breed VARCHAR(255)
);

CREATE TABLE owners (
id SERIAL4 PRIMARY KEY,
full_name VARCHAR(255),
species_desired VARCHAR(255)
);

CREATE TABLE adoptions (
id SERIAL4 PRIMARY KEY,
owner_id INT4 references owners(id) ON DELETE CASCADE,
animal_id INT4 references owners(id) ON DELETE CASCADE
);