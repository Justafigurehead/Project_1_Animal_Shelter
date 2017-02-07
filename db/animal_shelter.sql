DROP TABLE animals CASCADE;
DROP TABLE owners CASCADE;
DROP TABLE adoptions CASCADE;

CREATE TABLE animals (
id SERIAL4 PRIMARY KEY, 
animal_name VARCHAR(255), 
adoption_status VARCHAR(255),
admission_date DATE,
species VARCHAR(255),
ready_by_date DATE,
details TEXT,
animal_pic VARCHAR(255)
);

CREATE TABLE owners (
id SERIAL4 PRIMARY KEY,
full_name VARCHAR(255),
species_desired VARCHAR(255),
adopt_status BOOLEAN, 
extra_details TEXT
);

CREATE TABLE adoptions (
id SERIAL4 PRIMARY KEY,
owner_id INT4 references owners(id) ON DELETE CASCADE,
animal_id INT4 references owners(id) ON DELETE CASCADE
);