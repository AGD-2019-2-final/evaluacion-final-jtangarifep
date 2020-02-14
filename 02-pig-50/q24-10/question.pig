-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        REGEX_EXTRACT(birthday, '....-..-..', 2) 
--    FROM 
--        u;
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -put -f data.csv
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data_00 = FOREACH u GENERATE FLATTEN(STRSPLIT(birthday,'-'));
data_01 = FOREACH data_00 GENERATE $1;
STORE data_01 INTO 'output';
fs -get output/ .
fs -rm -f data.csv
fs -rm -r output

