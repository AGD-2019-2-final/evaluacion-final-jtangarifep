-- 
-- Pregunta
-- ===========================================================================
-- 
-- Para el archivo `data.tsv` compute la cantidad de registros por letra. 
-- Escriba el resultado a la carpeta `output` del directorio actual.
--
fs -rm -f -r output;
!hadoop fs -put data.tsv
data = LOAD 'data.tsv' USING PigStorage('\t') AS (col1:CHARARRAY, col2:CHARARRAY, col3:CHARARRAY);
data_grp = GROUP data BY col1;
data_count = FOREACH data_grp GENERATE group, COUNT(data.col1);
STORE data_count INTO 'output';
fs -get output/ .
fs -rm -f data.tsv
fs -rm -r output
