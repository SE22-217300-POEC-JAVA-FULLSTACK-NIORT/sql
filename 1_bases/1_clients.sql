/*
 - Créer une base de données nommée ventes
 - Créer dans cette base de données une table nommée `client` avec les colonnes
 - id entier en auto increment
 - first_name chaine de 50 caractères sans aucune contrainte
 - last_name chaine de 50 caractères sans aucune contrainte
 - email chaine de 50 caractères sans aucune contrainte
 - phone_number chaine de 15 caractères sans aucune contrainte

 - Ajouter une 
*/

-- 1. Création de la table clients
CREATE TABLE clients(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(50),
    phone_number VARCHAR(12)
);

-- 1 suite : Voir les colonnes
select * from information_schema.columns WHERE table_name='clients';

-- 2. Supprimer la table clients
DROP TABLE clients;

-- 3. Créer la table seulement si elle n'existe pas déjà
CREATE TABLE IF NOT EXISTS clients();

-- 4. Supprimer la table seulement si elle existe
DROP TABLE IF EXISTS clients;

-- 5. Renommer une colonne
ALTER TABLE clients RENAME COLUMN phone_number TO phone; 

-- 6. Modifier une colonne en ajoutant des contraintes
-- 6.a. NOT NULL
ALTER TABLE clients ALTER COLUMN first_name SET NOT NULL
-- 6.b UNIQUE
ALTER TABLE clients ADD UNIQUE(email)
ALTER TABLE clients ADD UNIQUE(email,phone) -- combinaison(email,username)

-- 7. Changer le type de données
ALTER TABLE clients 
ALTER COLUMN fist_name TYPE CHAR(50);

-- 8. Ajouter une colonne
ALTER TABLE clients ADD middle_name VARCHAR(50);

-- 9. Supprimer une colonne
ALTER TABLE clients DROP COLUMN middle_name;


-- 10. Création de la table phones
-- D'abord retirer de la table clients le champ téléphones
ALTER TABLE clients DROP COLUMN phone;
CREATE TABLE IF NOT EXISTS phone_numbers(
    id SERIAL PRIMARY KEY,
    number VARCHAR(20) NOT NULL,
    client_id INTEGER NOT NULL REFERENCES clients(id) ON DELETE CASCADE
);