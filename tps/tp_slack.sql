
-- Le canal Général est le canal par défaut.Il ne peut pas être supprimé
-- L'utilisateur peut créer des canaux sur slack
-- canaux :
--         - name
-- Des messages peuvent être ajoutés que dans des canaux
-- message:
--       - contenu(posté par un utilisateur statique)

-- Fournir les requêtes de création des tables
-- insertion des canaux
-- insertion messages
-- lister des message pour un canal donné
-- effacer un message
-- mettre à jour un message
-- voir un message en particulier
-- Supprimer un canal
-- Modifier un canal
-- Voir tous les messages d'un canal
-- Voir tous les canaux créés par un utilisateur donné
-- Supprimer tous les messages d'un canal donné
CREATE TABLE IF NOT EXISTS  users(
    id SERIAL PRIMARY KEY,
    username VARCHAR(20) UNIQUE NOT NULL ,
    email VARCHAR(50) UNIQUE NOT NULL
);


CREATE TABLE IF NOT EXISTS channel(
    id SERIAL PRIMARY KEY,
    name VARCHAR(20) UNIQUE NOT NULL,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);

CREATE TABLE IF NOT EXISTS messages(
    id SERIAL PRIMARY KEY,
    content TEXT NOT NULL,
    channel_id INTEGER NOT NULL REFERENCES channel(id) ON DELETE CASCADE,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL
);
