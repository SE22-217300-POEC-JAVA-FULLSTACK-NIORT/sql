CREATE TABLE IF NOT EXISTS users(
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    username VARCHAR(20) UNIQUE NOT NULL,
    email VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS posts(
    id SERIAL PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    content TEXT NOT NULL,
    user_id INTEGER NOT NULL REFERENCES users(id) ON DELETE CASCADE
);


-- ON DELETE SET RESTRICT
-- ON DELETE SET NULL
-- ON DELETE CASCADE
-- ON UPDATE CASCADE
CREATE TABLE IF NOT EXISTS likes(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users(id) ON DELETE SET NULL,
    post_id INTEGER NOT NULL REFERENCES posts(id) ON DELETE CASCADE
);


insert into users (first_name, last_name, email, username) values ('Grazia', 'Starmore', 'gstarmore0@storify.com', 'gstarmore0');
insert into users (first_name, last_name, email, username) values ('Allyn', 'Chinery', 'achinery1@salon.com', 'achinery1');
insert into users (first_name, last_name, email, username) values ('Berky', 'Mont', 'bmont2@sfgate.com', 'bmont2');
insert into users (first_name, last_name, email, username) values ('Lorenzo', 'Eckels', 'leckels3@reuters.com', 'leckels3');
insert into users (first_name, last_name, email, username) values ('Giulia', 'Gasnoll', 'ggasnoll4@stumbleupon.com', 'ggasnoll4');


insert into posts (title, content, user_id) values ('mission-critical', 'Synchronised dedicated info-mediaries', 2);
insert into posts (title, content, user_id) values ('Digitized', 'Grass-roots grid-enabled monitoring', 3);
insert into posts (title, content, user_id) values ('collaboration', 'Business-focused didactic capacity', 3);
insert into posts (title, content, user_id) values ('moderator', 'Vision-oriented encompassing methodology', 4);
insert into posts (title, content, user_id) values ('Upgradable', 'Digitized transitional encryption', 3);
insert into posts (title, content, user_id) values ('empowering', 'Devolved homogeneous firmware', 3);
insert into posts (title, content, user_id) values ('policy', 'Public-key optimizing capability', 3);
insert into posts (title, content, user_id) values ('zero administration', 'Implemented bottom-line data-warehouse', 1);
insert into posts (title, content, user_id) values ('Exclusive', 'Re-engineered intangible data-warehouse', 2);
insert into posts (title, content, user_id) values ('Vision-oriented', 'Automated stable superstructure', 3);
insert into posts (title, content, user_id) values ('context-sensitive', 'Reactive high-level open architecture', 4);
insert into posts (title, content, user_id) values ('multimedia', 'Reverse-engineered homogeneous instruction set', 3);
insert into posts (title, content, user_id) values ('systemic', 'Intuitive scalable leverage', 5);
insert into posts (title, content, user_id) values ('fault-tolerant', 'Open-source dedicated paradigm', 3);
insert into posts (title, content, user_id) values ('foreground', 'Automated logistical instruction set', 4);
insert into posts (title, content, user_id) values ('hub', 'Synergistic high-level complexity', 1);
insert into posts (title, content, user_id) values ('dedicated', 'Customizable object-oriented service-desk', 3);
insert into posts (title, content, user_id) values ('hub', 'Decentralized secondary challenge', 3);
insert into posts (title, content, user_id) values ('toolset', 'Ergonomic real-time parallelism', 2);
insert into posts (title, content, user_id) values ('multi-tasking', 'Expanded impactful moratorium', 4);
insert into posts (title, content, user_id) values ('next generation', 'Cross-platform regional pricing structure', 5);
insert into posts (title, content, user_id) values ('capability', 'Versatile multi-state complexity', 4);
insert into posts (title, content, user_id) values ('database', 'Business-focused asymmetric software', 3);
insert into posts (title, content, user_id) values ('Upgradable', 'Managed coherent moderator', 4);
insert into posts (title, content, user_id) values ('eco-centric', 'Inverse 3rd generation initiative', 5);
insert into posts (title, content, user_id) values ('impactful', 'Realigned 5th generation groupware', 3);
insert into posts (title, content, user_id) values ('tertiary', 'Integrated intermediate middleware', 4);
insert into posts (title, content, user_id) values ('circuit', 'Optimized 5th generation projection', 2);
insert into posts (title, content, user_id) values ('installation', 'Re-engineered actuating encryption', 5);
insert into posts (title, content, user_id) values ('Networked', 'Persistent bifurcated adapter', 1);

insert into likes (post_id, user_id) values (25, 4);
insert into likes (post_id, user_id) values (6, 5);
insert into likes (post_id, user_id) values (25, 3);
insert into likes (post_id, user_id) values (19, 5);
insert into likes (post_id, user_id) values (7, 4);
insert into likes (post_id, user_id) values (20, 1);
insert into likes (post_id, user_id) values (12, 3);
insert into likes (post_id, user_id) values (8, 3);
insert into likes (post_id, user_id) values (14, 3);
insert into likes (post_id, user_id) values (28, 2);
insert into likes (post_id, user_id) values (23, 5);
insert into likes (post_id, user_id) values (28, 5);
insert into likes (post_id, user_id) values (28, 4);
insert into likes (post_id, user_id) values (26, 4);
insert into likes (post_id, user_id) values (23, 3);
insert into likes (post_id, user_id) values (3, 5);
insert into likes (post_id, user_id) values (14, 4);
insert into likes (post_id, user_id) values (21, 2);
insert into likes (post_id, user_id) values (4, 1);
insert into likes (post_id, user_id) values (24, 5);
insert into likes (post_id, user_id) values (17, 5);
insert into likes (post_id, user_id) values (27, 3);
insert into likes (post_id, user_id) values (24, 3);
insert into likes (post_id, user_id) values (7, 4);
insert into likes (post_id, user_id) values (2, 2);
insert into likes (post_id, user_id) values (16, 4);
insert into likes (post_id, user_id) values (23, 4);
insert into likes (post_id, user_id) values (16, 4);
insert into likes (post_id, user_id) values (27, 1);
insert into likes (post_id, user_id) values (4, 2);
insert into likes (post_id, user_id) values (21, 5);
insert into likes (post_id, user_id) values (9, 2);
insert into likes (post_id, user_id) values (22, 2);
insert into likes (post_id, user_id) values (8, 4);
insert into likes (post_id, user_id) values (17, 2);
insert into likes (post_id, user_id) values (25, 1);
insert into likes (post_id, user_id) values (27, 5);
insert into likes (post_id, user_id) values (23, 3);
insert into likes (post_id, user_id) values (3, 5);
insert into likes (post_id, user_id) values (12, 5);
insert into likes (post_id, user_id) values (26, 2);
insert into likes (post_id, user_id) values (8, 2);
insert into likes (post_id, user_id) values (26, 4);
insert into likes (post_id, user_id) values (1, 1);
insert into likes (post_id, user_id) values (6, 5);
insert into likes (post_id, user_id) values (18, 4);
insert into likes (post_id, user_id) values (23, 4);
insert into likes (post_id, user_id) values (21, 1);
insert into likes (post_id, user_id) values (26, 3);
insert into likes (post_id, user_id) values (5, 2);
insert into likes (post_id, user_id) values (7, 1);
insert into likes (post_id, user_id) values (3, 4);
insert into likes (post_id, user_id) values (2, 2);
insert into likes (post_id, user_id) values (3, 2);
insert into likes (post_id, user_id) values (18, 3);
insert into likes (post_id, user_id) values (4, 1);
insert into likes (post_id, user_id) values (14, 1);
insert into likes (post_id, user_id) values (8, 4);
insert into likes (post_id, user_id) values (20, 3);
insert into likes (post_id, user_id) values (7, 2);

