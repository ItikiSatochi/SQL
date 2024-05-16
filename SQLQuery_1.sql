DECLARE --quando voce declara varias DECLARE no mesmo
    @idade INT = 39,
    @Niver DATETIME = '1985-02-06',   
    @nome VARCHAR(10) = 'Diego';
SELECT 
    @nome AS Nome, 
    @idade AS Idade, 
    @Niver AS Data_de_Nascimento;