-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Escriba el código equivalente a la siguiente consulta SQL.
-- 
--    SELECT 
--        firstname,
--        color
--    FROM 
--        u
--    WHERE 
--        color REGEXP '.n';
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
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
data_00 = FOREACH u GENERATE firstname,color;
data_01 = FOREACH data_00 GENERATE firstname,color,(REGEX_EXTRACT_ALL(color,'.*n')) AS col_rex;
data_02 = FILTER data_01 BY col_rex IS NOT NULL;
data_03 = FOREACH data_02 GENERATE firstname,color;
STORE data_03 INTO 'output' USING PigStorage (',');
fs -get output/ .
fs -rm -f data.csv
fs -rm -r output
