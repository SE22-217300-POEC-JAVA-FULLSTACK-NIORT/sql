/*
 - id
   # doit toujouts être unique
   # sa valeur ne peut jamais être vide
   
  - Types chaines
  # CHAR(10) => "chris     "
  # VARCHAR(10) => "chris"
  # TEXT 
*/

-- CREATE TABLE clients(
--   id SERIAL PRIMARY KEY,
--   names VARCHAR(50),
--   email VARCHAR(50)
-- )

-- 1. Créer 3 clients

-- INSERT INTO clients(names,email)
-- VALUES
--     ('Christian Lisangola','christian.lisangola@gmail.com'),
--     ('Pierre Gauthier','pierre.gauthier@gmail.com'),
--     ('Lionel Messi','lionel.messi@gmail.com')

-- 2. Lister tous les clients qui ont été créé
-- SELECT * FROM clients;

-- INSERT INTO clients(names,email)
-- VALUES
--     ('Karim KB9','kb9@yahoo.fr'),
--     ('Neymar Silva','ney@yahoo.com'),
--     ('Zinedine Zidane','zizou@hotmail.fr'),
--     ('Thierry Henry','titi@hotmail.fr');

-- 3. Lister tous les clients qui possèdent des adresses gmail
-- SELECT * FROM clients WHERE email LIKE '%@gmail.%';
-- 4. Lister tous les clients qui possèdent des  adresses yahoo
-- SELECT * FROM clients WHERE email LIKE '%@yahoo.%';
-- 5. Lister tous les clients qui possèdent des  adresses hotmail
-- SELECT * FROM clients WHERE email LIKE '%@hotmail.fr%';

-- DROP TABLE users;

-- CREATE TABLE IF NOT EXISTS users(
--   id SERIAL PRIMARY KEY,
--   firstName VARCHAR(50),
--   lastName VARCHAR(50),
--   country VARCHAR(50),
--   dateOfBirth DATE -- 23 APRIL 1998 | 1998-04-23
-- );

-- Ajouter un middleName.Il peut ne pas être renseigné
-- ALTER TABLE users ADD COLUMN middlename VARCHAR(50);
-- faire en sort que les first name et last soient obligatoires
-- ALTER TABLE users ALTER COLUMN firstName SET NOT NULL;
-- Ajouter un champ email qui soient obligatoire et unique
-- ALTER TABLE users ADD email VARCHAR(50) NOT NULL;

-- Lister les colonnes de la table users
-- SELECT * FROM information_schema.columns WHERE table_name='users';

-- 1. Faire en sorte que le champ lastName et dateOfBirth ne soient jamais vide
-- ALTER TABLE users ALTER COLUMN dateOfBirth SET NOT NULL;
-- 2. Rendre l'adresse email unique(faire recherches)
-- ALTER TABLE users ADD UNIQUE(email);
-- 3. Renommer le champ middlename en middleName(quelques petites recherches)
-- ALTER TABLE users RENAME COLUMN middlename TO middle_name;
-- 4.Renommer dateOfBirth en date_of_birth
-- ALTER TABLE users RENAME COLUMN dateOfBirth TO date_of_birth;
-- 5. Renommer firstName en first_name
-- ALTER TABLE users RENAME COLUMN firstName TO first_name;
-- 6. Renommer lastName en last_name
-- ALTER TABLE users RENAME COLUMN lastName TO last_name;
-- 7. Faire le le first_name ne soit jamais vide
-- ALTER TABLE users ALTER COLUMN first_name SET NOT NULL;



-- Limiter le résultat à 5 enregistrements
-- SELECT * FROM users LIMIT 5; -- [1][2][3][4][5][6][7][8][9]

-- Sauter les 40 premiers enregistrements
-- SELECT * FROM users OFFSET 40;

-- SELECT * FROM users OFFSET 21 LIMIT 5;

-- Calculer l'age actuelle
select date_part('years', age('04-23-1992'::date))::int;

insert into users(first_name,last_name,email,date_of_birth)
values
    ('Christian','Lisangola','christian.lisangola@gmail.com','23 April 1992'),
    ('Christophe','Gueroult','c.gueroult@coderbase.io','03 October 2001'),
    ('Xabier','Heguy','xabier.heguy@m2i.com','10 August 1999');


-- Montrer les ages
SELECT date_part('years', age(date_of_birth::date))::int  FROM users;

-- Montrer les noms et ages
SELECT concat(first_name,' ',last_name) as full_name,date_part('years', age(date_of_birth::date))::int  FROM users;


-- Sous requetes : Créer une table avec nom,prenom,ages
SELECT  *  FROM (SELECT first_name, last_name,date_part('years', age(date_of_birth::date))::int as ages FROM users) as u;

-- Requeter sur la sous requetes pour avoir les ages
SELECT  first_name,last_name,age  FROM (SELECT first_name, last_name,date_part('years', age(date_of_birth::date))::int as age FROM users) as u WHERE u.age>=30;