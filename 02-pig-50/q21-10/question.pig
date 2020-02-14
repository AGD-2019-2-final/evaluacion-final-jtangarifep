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
--        color REGEXP 'blue|green';
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

data_00 = FOREACH u GENERATE firstname,color;
data_01 = FOREACH data_00 GENERATE firstname, (REGEX_EXTRACT_ALL(color,'(blue)|(green)')) AS col_rex;
data_02 = FILTER data_01 BY (col_rex IS NOT NULL);
data_03 = FOREACH data_02 GENERATE firstname, FLATTEN(col_rex) AS col_rex;
STORE data_03 INTO 'output' USING PigStorage ('\t');
fs -get output/ .
fs -rm -f data.csv
fs -rm -r output