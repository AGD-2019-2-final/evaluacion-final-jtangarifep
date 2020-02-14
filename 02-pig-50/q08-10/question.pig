-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra de la 
-- columna 2 y clave de al columna 3; esto es, por ejemplo, la cantidad de 
-- registros en tienen la letra `b` en la columna 2 y la clave `jjj` en la 
-- columna 3 es:
-- 
--   ((b,jjj), 216)
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;
fs -put -f data.tsv
data_01 = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:BAG{}, col3:MAP[]);
data_02 = FOREACH data_01 GENERATE FLATTEN(col2),FLATTEN(col3);
data_03 = FOREACH data_02 GENERATE ($0,$1) AS col1;
group_data = GROUP data_03 BY col1;
data_04 = FOREACH group_data GENERATE group, COUNT(data_03);
data_05 = ORDER data_04 BY $0;
STORE data_05 INTO 'output';
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output