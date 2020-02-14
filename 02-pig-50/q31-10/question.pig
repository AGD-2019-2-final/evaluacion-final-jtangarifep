-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Cuente la cantidad de personas nacidas por año.
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
--
-- >>> Escriba su respuesta a partir de este punto <<<
--
data_00 = FOREACH u GENERATE GetYear(ToDate(birthday,'yyyy-MM-dd')) AS (Year:CHARARRAY), 1 AS (valor:INT);
group_00 = GROUP data_00 BY Year;
data_01 = FOREACH group_00 GENERATE group, SUM(data_00.valor);
STORE data_01 INTO 'output' USING PigStorage (',');
fs -get output/ .
fs -rm -f data.csv
fs -rm -r output