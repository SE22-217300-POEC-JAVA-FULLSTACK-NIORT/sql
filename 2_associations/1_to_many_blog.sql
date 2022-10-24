
-- One To Many
CREATE TABLE user(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,-- Eux vont ajouter une contrainte d'unicité
);

CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(200),
    content TEXT,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

CREATE TABLE comments(
    id SERIAL PRIMARY KEY,
    content TEXT,
    post_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);

-- Insertion dans la table users
insert into users (first_name, last_name, email) 
values 
    ('Hakeem', 'Hast', 'hhast0@dailymail.co.uk'),
    ('Sibbie', 'Lillicrop', 'slillicrop1@intel.com'),
    ('Bryanty', 'Crosetto', 'bcrosetto2@gizmodo.com'),
    ('Alasteir', 'Milburn', 'amilburn3@dailymotion.com'),
    ('Daisy', 'Folder', 'dfolder4@cargocollective.com'),
    ('Meredithe', 'Menendez', 'mmenendez5@washington.edu'),
    ('Garret', 'Lewsley', 'glewsley6@goo.gl'),
    ('Avery', 'Autrie', 'aautrie7@apache.org'),
    ('Cobbie', 'Linger', 'clinger8@skype.com'),
    ('Tobey', 'Getcliffe', 'tgetcliffe9@drupal.org');
-- Insertion dans la table posts
insert into users (title, content, user_id) 
values 
    ('C++', 'Langage très puissant.', 1),
    ('Java', 'Langage utilisé par Spring.', 1),
    ('Go', 'Il a été développé par des ingénieurs de Google.', 2),
    ('Angular', 'Solution très robuste pour faire du développement Web', 3),
    ('React.js', 'Solution Ignoble de Facebook', 4),
    ('Ruby On Rails', 'A la base il avait été utilisé pour créer Github et Twitter.', 4),
    ('Action Script 3', 'Le dinausore', 4),
    ('VB Script', 'Est-ce VB Script existe toujours', 4),
    ('Nest.js', 'Le Spring du monde JS', 3),
    ('Node.js', 'Non blocking I/O', 7);

-- Insertion dans la table comments
insert into comments(content,user_id, post_id)
values
    ('Il parait que C++ a été utilisé pour créer Go.',3,1),
    ('Go utilise le garbage collector selon les recherches.',4,1),
    ('Venant du monde React, je ne suis pas déçu par Angular.',1,3),
    ('Il offre une arhitecture robuste.',7,3),
    ('Il est basé sur JS et V8.',1,7),
    ('LibUv en fait parti.',3,7),
    ('Très pour les opérations I/O.',5,7),


-- Requetes LMD