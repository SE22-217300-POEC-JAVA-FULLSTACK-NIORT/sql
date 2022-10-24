CREATE TABLE IF NOT EXISTS continents(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS  countries(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    continent_id INTEGER NOT NULL REFERENCES continents(id) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS  capitals(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    country_id INTEGER UNIQUE NOT NULL REFERENCES countries(id) ON DELETE CASCADE
);

INSERT INTO continents(name)
values('Afrique'),('Amérique'),('Asie'),('Europe'),('Océanie')

INSERT INTO countries(name,continent_id)
VALUES 
    ('France',4),
    ('USA',2),
    ('Chine',3),
    ('Kenya',1),
    ('Zimbabwe',1),
    ('Italie',4),
    ('Espagne',4),
    ('Brésil',2),
    ('Australie',5),
    ('Nouvelle-Zélande',5);

INSERT INTO capitals(name,country_id)
VALUES
    ('Paris',1),
    ('Washington',2),
    ('Pekin',3),
    ('Nairobi',4),
    ('Harare',5),
    ('Rome',6),
    ('Madrid',7),
    ('Brasilia',8),
    ('Canberra',9),
    ('Wellington',10);



-- 1. Trouver le pays dont la capital est 'Paris'
SELECT capitals.name FROM countries
    JOIN capitals 
    ON countries.id=capitals.country_id 
    WHERE LOWER(countries.name)='france'
-- 2. Trouver tous les Pays du continent Américain
SELECT countries.name FROM continents
    JOIN countries 
    ON continents.id=countries.continent_id 
    WHERE LOWER(continents.name)='amérique';

    