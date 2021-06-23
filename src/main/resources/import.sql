-- CATEGORIES
INSERT INTO category (name) VALUES ('Traditional');
INSERT INTO category (name) VALUES ('Vegetarian');
INSERT INTO category (name) VALUES ('Vegan');

INSERT INTO category (name) VALUES ('Antipasti');
INSERT INTO category (name) VALUES ('Pasta');
INSERT INTO category (name) VALUES ('Sandwiches');
INSERT INTO category (name) VALUES ('Wraps');
INSERT INTO category (name) VALUES ('FastFood');
INSERT INTO category (name) VALUES ('Bowls');
INSERT INTO category (name) VALUES ('Asian');

INSERT INTO category (name) VALUES ('Dessert');
INSERT INTO category (name) VALUES ('Salad');


-- RECIPES
INSERT INTO recipe (title, subtitle, ingredients, portions, prep_time, steps, category_id, user_id, date) VALUES ('Doner/Kebab', 'Lecker', '30g Zucker', 1, 5, 'Fleisch braten und in Fladenbrot legen etc.', 8, 1, '2021-06-19');
INSERT INTO recipe (title, subtitle, ingredients, portions, prep_time, steps, category_id, user_id) VALUES ('Pasta', 'Lecker', '30g Zucker', 1, 5, 'Fleisch braten und in Fladenbrot legen etc.', 12, 2);
INSERT INTO recipe (title, subtitle, ingredients, portions, prep_time, steps, category_id, user_id) VALUES ('Rice with Tomatoes', 'Lecker', '30g Zucker', 1, 5, 'Fleisch braten und in Fladenbrot legen etc.', 5, 1);
INSERT INTO recipe (title, subtitle, ingredients, portions, prep_time, steps, category_id, user_id) VALUES ('Lemom Cake', 'Lecker', '30g Zucker', 1, 5, 'Fleisch braten und in Fladenbrot legen etc.', 3, 2);
INSERT INTO recipe (title, subtitle, ingredients, portions, prep_time, steps, category_id, user_id) VALUES ('Margherita Homemade', 'Lecker', '30g Zucker', 1, 5, 'Fleisch braten und in Fladenbrot legen etc.', 1, 1);
INSERT INTO recipe (title, subtitle, ingredients, portions, prep_time, steps, category_id, user_id) VALUES ('Spinach', 'Lecker', '30g Zucker', 1, 5, 'Fleisch braten und in Fladenbrot legen etc.', 10, 2);


INSERT INTO user(username,password,role,first_name,last_name,email,is_pw,accept_terms,confirm_pw,emailcorrect) VALUES ('admin','$2a$10$j8kKMynCBacALgRZvdtU2ezRo8cZJUash26OOUBBXsfzTTj/Xt5vG', 'ROLE_ADMIN','Test', 'Test',  'email@email.com', true ,true, '$2a$10$j8kKMynCBacALgRZvdtU2ezRo8cZJUash26OOUBBXsfzTTj/Xt5vG',true);
INSERT INTO user(username,password,role,first_name,last_name,email,is_pw,accept_terms,confirm_pw,emailcorrect) VALUES ('user','$2a$10$wzVJFOPkNz410shGyVcHseQDnHKNKuKCphIr1iLj4Xw.Bvrgce3ai', 'ROLE_USER','Test', 'Test',  'email@email.com', true ,true, '$2a$10$wzVJFOPkNz410shGyVcHseQDnHKNKuKCphIr1iLj4Xw.Bvrgce3ai',true);




-- COUNTRIES (EXPERIMENTAL)
INSERT INTO country (country) VALUE ('Austria')
INSERT INTO country (country) VALUE ('France')
INSERT INTO country (country) VALUE ('Germany')
INSERT INTO country (country) VALUE ('Croatia')
INSERT INTO country (country) VALUE ('Greece')
INSERT INTO country (country) VALUE ('Italy')
INSERT INTO country (country) VALUE ('Spain')
INSERT INTO country (country) VALUE ('Switzerland')
INSERT INTO country (country) VALUE ('United Kingdom')
INSERT INTO country (country) VALUE ('Netherlands')