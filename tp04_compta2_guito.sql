SELECT * FROM article;
SELECT * FROM article WHERE PRIX > 2;
SELECT * FROM article WHERE PRIX > 2 AND PRIX < 6.25;
SELECT * FROM article WHERE PRIX BETWEEN 2 AND 6.25;
SELECT * FROM article WHERE NOT (PRIX >2 AND PRIX < 6.25) AND ID_FOU ==1;
SELECT * FROM article WHERE ID_FOU ==1 AND ID_FOU == 3;
SELECT * FROM article WHERE ID_FOU IN (1, 3);
SELECT * FROM article WHERE ID_FOU NOT IN (1, 3);

SELECT * FROM article WHERE BETWEEN '2019-02-01' AND '2019-04-30';