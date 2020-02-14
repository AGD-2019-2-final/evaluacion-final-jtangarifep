-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
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
data_01 = FOREACH u GENERATE surname, (int)SIZE(surname) AS tam;
data_02 = ORDER data_01 BY tam DESC;
data_03 = FILTER data_02 BY (tam > 6);
data_04 = FILTER data_02 BY (tam == 6);
data_05 = ORDER data_04 BY surname;
data_06 = LIMIT data_05 2;
data_07 = UNION data_03,data_06;
STORE data_07 INTO 'output' USING PigStorage(',');
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output