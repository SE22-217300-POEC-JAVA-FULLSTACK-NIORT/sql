CREATE TABLE people(
    id SERIAL PRIMARY KEY,
    names VARCHAR(50) NOT NULL
);
CREATE TABLE properties(
id SERIAL PRIMARY KEY,
name VARCHAR(50) NOT NULL,
address VARCHAR(200) NOT NULL
);
CREATE TABLE people_properties(
    person_id INTEGER NOT NULL REFERENCES people(id),
    property_id INTEGER NOT NULL REFERENCES properties(id),
);

-- Requetes LMD

INSERT INTO people(names)
VALUES
    ('Christian Lisangola'),
    ('Zinedine Zidane'),
    ('Karim Benzema')

INSERT INTO properties(name,address)
VALUES
    ('Hotel Blablabla'),
    ('Parc des Princesses'),
    ('Karim Tower')


INSERT INTO properties(person_id,property_id)
VALUES
    (1,1),
    (2,1),
    (3,1),
    (3,3),
    (3,2),
    (2,2)