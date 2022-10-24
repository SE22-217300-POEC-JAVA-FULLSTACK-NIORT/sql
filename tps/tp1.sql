-- Telephones

-- 1. Création de la table
CREATE TABLE telephones(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) NOT NULL UNIQUE,
    manufacturer VARCHAR(20) NOT NULL UNIQUE,
    price INTEGER NOT NULL CHECK(price>0),
    units_sold INTEGER NOT NULL
);

-- 2. Insertion des données
INSERT INTO telephones(name,manufacturer,price,units_sold)
VALUES
    ('N1280','Nokia',199,1925),
    ('Iphone 4','Apple',399,9436),
    ('Galaxy S 5','Samsung',299,2359),
    ('S5620 Monte','Samsung',250,2385),
    ('N8','Nokia',150,7543),
    ('Droid','Motorola',150,8395),
    ('Iphone 13 Pro Max','Apple',1300,12849),
    ('Galaxy Note 20','Samsung',1100,10353),
    ('Redmi Note 8','Xiaomi',600,12345),
    ('Honor 20','Huawei',230,3432),
    ('Mate 20','Huawei',800,38893),
    ('Lumia','Nokia',210,4342);


-- 3. Requêtes

-- a.Ecrire une requête pour liste tous les modèles de téléphones
SELECT name FROM telephones;

-- b. Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphone dont le prix est supérieur à 200€
SELECT name,manufacturer,price FROM telephones WHERE price>200;

-- c. Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous les téléphone dont le prix est varie entre 150 et 200€
SELECT name,manufacturer,price FROM telephones WHERE price BETWEEN 150 AND 200;

-- d. Lister tous les téléphones de marque samsung et Apple
SELECT * FROM telephones WHERE manufacturer IN ('samsung','apple');
SELECT * FROM telephones WHERE LOWER(manufacturer) IN (LOWER('Samsung'),LOWER('Apple'));
SELECT * FROM telephones WHERE LOWER(manufacturer) = 'apple' OR LOWER(manufacturer) ='samsung';

-- e. Afficher le revenu total pour les téléphones vendues.Pour chaque téléphone, vous avez le prix et la quantité vendu
SELECT name,(price*units_sold) AS total_revenu FROM telephones;
SELECT name,(price*units_sold) AS total_revenu FROM telephones ORDER BY total_revenu DESC;

-- f. Afficher le nombre des téléphones Apple
SELECT COUNT(*) FROM telephones WHERE LOWER(manufacturer)='apple';

-- f. Afficher le nombre des téléphones Apple vendus

-- g. Afficher toutes les données de la table téléphone en renommant les champs de la manière suivante : name=>modèle, manufacturer => fabricant, price => prix, units_sold => quantité vendue
SELECT name AS modele, manufacturer AS fabricant, price AS prix,units_sold AS quantite_vendue FROM telephones;

-- h. Afficher tous les téléphones dont le prix total des ventes est supérieur à 1300000€.
-- v1
SELECT name,(price*units_sold) AS total_ventes FROM telephones WHERE (price*units_sold)>1300000 ORDER BY total_ventes DESC;
-- v2
SELECT name,total_sales FROM 
    (SELECT name,(price*units_sold) as total_sales FROM telephones) AS total
 WHERE total_sales >1300000 ORDER BY total_sales DESC;

-- i. Afficher le total de vente des appareils
SELECT SUM(price*units_sold) AS total_sales FROM telephones;

-- PAS DANS LE TP
-- j. Afficher la somme/moyenne/max de toute les vente
SELECT SUM(units_sold) as total_des_ventes FROM telephones;
SELECT AVG(units_sold) as total_des_ventes FROM telephones;
SELECT MAX(units_sold) as total_des_ventes FROM telephones;
SELECT MIN(units_sold) as total_des_ventes FROM telephones;

-- i. Le prix total de tous les telephones de toutes les marques
-- Pas très pertinente comme scénario, mais ça reste une requête pour s'entrainer
SELECT manufacturer, sum(prix) FROM telephones GROUP BY manufacturer;

-- k. Le total des ventes tous les telephones par marque
SELECT manufacturer, sum(prix*units_sold) FROM telephones GROUP BY manufacturer;

-- l. Le total des ventes tous les telephones Apple
SELECT manufacturer, sum(price*units_sold) FROM telephones where manufacturer='Apple' GROUP BY manufacturer;

-- m. Tous toutes les marques dont le CA > 20000000
        SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire
            FROM telephones 
            GROUP BY manufacturer 
            HAVING SUM(price*units_sold)>20000000;

        -- OR
        SELECT manufacturer, chiffre_affaire 
            FROM 
                (
                    SELECT manufacturer,SUM(price*units_sold) as chiffre_affaire 
                    FROM telephones
                    GROUP BY manufacturer
                ) AS temporay 
            WHERE
                chiffre_affaire >20000000;

        -- non pertitente
        SELECT manufacturer,CONCAT(SUM(price*units_sold),"€") as chiffre_affaire 
            FROM telephones 
            GROUP BY manufacturer 
            HAVING SUM(price*units_sold)>20000000;


-- n. Vente par fabricant
SELECT manufacturer,SUM(units_sold) FROM telephones GROUP BY manufacturer;


-- o. Vente par fabricant avec unité
SELECT manufacturer,CONCAT(SUM(price*units_sold),"€") as chiffre_affaire FROM telephones GROUP BY manufacturer;

-- p. Téléphones plus chers que la moyenne
SELECT name,manufacturer,price FROM telephones WHERE price > (SELECT AVG(price) FROM telephones);

-- q. Téléphones moins chers que la moyenne
SELECT name,manufacturer,price FROM telephones WHERE price < (SELECT AVG(price) FROM telephones);

-- r. ventre par fabricant par ordre décroissant de CA
SELECT manufacturer,sum(price*units_sold) as ca FROM telephones GROUP BY manufacturer ORDER BY ca DESC;

-- NE PAS FAIRE Conséquences de na pas utiliser GROUP BY on aura qu'un seul résultat : On a un seul telephone mais avec le CA total :D
SELECT manufacturer,sum(price*units_sold) as ca FROM telephones;