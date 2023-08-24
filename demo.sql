CREATE DATABASE UnityDemo;                              -- Création d'une base de données "UnityDemo"
GO                                                      -- GO signifie que les commandes précédentes doivent être executées

USE UnityDemo;                                          -- Demander à utiliser la base de données "UnityDemo"
GO

CREATE TABLE T_office
(office_id INTEGER, 
office_address VARCHAR(30),
CONSTRAINT PF_office PRIMARY KEY (office_id))

CREATE TABLE T_course 
(crs_code CHAR(8) NOT NULL PRIMARY KEY,                 -- Le NOT NULL n'est pas une erreur, la PRIMARY KEY est NOT NULL, mais peut-être désactivée, contrairement au NOT NULL qui prtègera sans cesse des valeurs NULL
crs_name VARCHAR(30),                                   -- Pas d'espace blanc dans le nom + séparation entre colonnes et les contraintes non-liées
CONSTRAINT UK_crs UNIQUE (crs_name))                    -- si pas de virgule, alors la contrainte UK_crs correspond à la colonne
                                                        -- crs_name, donc pas besoin de parenthèses à la fin
CREATE TABLE T_professor 
(prf_is INTEGER NOT NULL PRIMARY KEY, 
prf_name VARCHAR(30), 
prf_course CHAR(8),
CONSTRAINT PK_course REFERENCES T_course (crs_code) 
ON DELETE SET NULL,                                     -- la virgule de la ligne précédente ne permet pas de faire le lien entre la contrainte et l'option
office_id CHAR(2) REFERENCES T_office CONSTRAINT
prf_name UNIQUE (prf_name))