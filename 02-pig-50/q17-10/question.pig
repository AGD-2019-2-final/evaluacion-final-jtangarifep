-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname, color 
--    FROM 
--        u
--    WHERE color IN ('blue','black');
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -put -f data.csv;
--
u = LOAD 'data.csv' USING PigStorage(',') 
    AS (id:int, 
        firstname:CHARARRAY, 
        surname:CHARARRAY, 
        birthday:CHARARRAY, 
        color:CHARARRAY, 
        quantity:INT);
data_00 = FOREACH u GENERATE firstname,color;
data_01 = FILTER data_00 BY color in ('blue','black');
STORE data_01 INTO 'output' USING PigStorage (',');
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output