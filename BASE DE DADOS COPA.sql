CREATE TABLE GRUPOS (
    GRUPO_ID    INT PRIMARY KEY IDENTITY, 
    NOME        VARCHAR(1) NOT NULL UNIQUE
);


CREATE TABLE TIMES(
   TIME_ID          INT PRIMARY KEY IDENTITY,
   NOME             VARCHAR (15) NOT NULL UNIQUE,
   ABREVIACAO       VARCHAR (5) NOT NULL UNIQUE,
   SCORE            NUMERIC(15,2),
   FK_ID_TIMES     INT,
FOREIGN KEY (FK_ID_TIMES) REFERENCES GRUPOS(GRUPO_ID)
);

SELECT * FROM GRUPOS
INSERT INTO GRUPOS(NOME)
        VALUES  
            ('A'), ('B'),
            ('C'), ('D'),
            ('E'), ('F'),
            ('G'), ('H');

INSERT INTO TIMES (NOME, ABREVIACAO, SCORE, FK_ID_TIMES)
    VALUES 
       ('CATAR','CAT',1442.0,1),            ('EQUADOR','EQU',1463.7,1),
       ('HOLANDA','HOL',1679.4,1),          ('SENEGAL','SEN',1584.6,1),
       ('ESTADOS UNIDOS','EUA',1635.0,2),   ('INGLATERRA','ENG',1737.5,2),
       ('IRÃ','IRA',1558.6,2),              ('ROMENIA','ROU',1582.1,2),
	   ('ARGENTINA','ARG',1770.7,3),        ('AUSTRALIA','AUS',1483.7,4), 
       ('ALEMANHA','ALE',1659.0,5),         ('BELGICA','BEL',1821.9,6),
       ('BRASIL','BRA',1837.6,7),           ('CHILE','CHI',1526.0,8),
	   ('DINAMARCA','DIN',1665.5,4),        ('COSTA RICA','COS',1500.1,5),
       ('CANADA','CAN',1473.8,6),           ('CAMAROES','CAM',1485.0,7),
       ('GANA','GAN',1393.5,8),             ('MEXICO','MEX',1649.6,3), 
       ('FRANCA','FRA',1764.9,4),           ('ESPANHA','ESP',1716.9,5),
       ('CROACIA','CRO',1632.2,6),          ('SUICA','SUI',1621.4,7),
       ('PORTUGAL','POR',1678.7,8),         ('POLONIA','POL',1546.2,3), 
       ('TUNISIA','TUN',1507.9,4),          ('JAPAO','JAP',1554.7,5),
       ('MARROCOS','MAR',1558.4,6),         ('SERVIA','SRB',1549.5,7),
       ('URUGUAI','URU',1641.0,8),          ('FINLANDIA','FIN',1435.7,3);

SELECT * FROM TIMES

SELECT 
    G.NOME      AS GRUPOS,
    T.NOME      AS SELECAO,
    T.SCORE     AS PONTUACAO
FROM GRUPOS     AS G 
    JOIN TIMES AS T 
        ON (T.FK_ID_TIMES = G.GRUPO_ID)
ORDER BY 
SCORE DESC;
