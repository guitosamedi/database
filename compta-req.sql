CREATE TABLE `article` (
  `id` int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `ref` VARCHAR(13) NOT NULL,
  `designation` VARCHAR(255),
  `prix` DECIMAL(7,2) NOT NULL DEFAULT 0,
  `id_fou` int(10) NOT NULL
);

CREATE TABLE `fournisseur` (
  `id` int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(255) NOT NULL
);

CREATE TABLE `bon` (
  `id` int(10) NOT NULL PRIMARY KEY AUTO_INCREMENT,
  `numero` int(10) NOT NULL,
  `delai` int(10) NOT NULL DEFAULT 0, 
  `date_cmde` timestamp NOT NULL DEFAULT current_timestamp(),
  `id_fou` int(10) NOT NULL
);

CREATE TABLE `compo` (
 `id` INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
 `qte` int(10) NOT NULL,
 `id_art` int(10) NOT NULL,
 `id_bon` INTEGER NOT NULL,
  FOREIGN KEY (id_art) REFERENCES article(id) ON DELETE RESTRICT,
  FOREIGN KEY (id_bon) REFERENCES bon(id) ON DELETE RESTRICT
);

ALTER TABLE article ADD CONSTRAINT FOREIGN KEY ( id_fou ) REFERENCES fournisseur (id);
ALTER TABLE bon ADD CONSTRAINT FOREIGN KEY ( id_fou ) REFERENCES fournisseur (id);

INSERT INTO `fournisseur` (`id`, `nom`) VALUES 
(1, 'Française d’Imports'),
(2, 'FDM SA'),
(3, 'Dubois & Fils3');

INSERT INTO `article` (`id`,`ref`,`designation`,`prix`,`id_fou`) VALUES 
(1,"A01", "Perceuse P1",74.99,1),
(2,"F01", "Boulon laiton 5 x 40 mm (sachet de 10)",2.25,2),
(3,"F02", "Boulon laiton 5 x 40 mm (sachet de 10)",4.45,2),
(4,"D01", "Boulon laiton 5 x 40 mm (sachet de 10)",4.40,3),
(5,"A02", "Meuleuse 125mm",37.85,1),
(6,"D03", "Boulon acier zingué 4 x 40mm (sachet de 10)",1.8,3),
(7,"A03", "Perceuse à colonne",185.25,1),
(8,"D04", "Coffret mêches à bois",12.25,3),
(9,"F03", "Coffret mêches plates",6.25,2),
(10,"F04", "Fraises d'encastrement",8.14,2);


INSERT INTO `compo` (`id`,`qte`,`id_art`,`id_bon`) VALUES 
(1, 3, 1, 1),
(2, 4, 5, 2),
(3, 1, 7, 3);

INSERT INTO `bon` (`id`,`numero`,`delai`,`date_cmde`, `id_fou`) VALUES 
(1, 8888, 3, "2020-04-12 18:12:0", 1),
(2, 9999, 3, "2021-06-02 10:34:51", 1),
(3, 1000, 3, "2020-04-12 08:41:29", 1);